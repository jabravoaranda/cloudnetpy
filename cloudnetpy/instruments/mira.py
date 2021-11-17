"""Module for reading raw cloud radar data."""
import os
from typing import List, Optional
from tempfile import NamedTemporaryFile
import numpy as np
from cloudnetpy import output, utils
from cloudnetpy.instruments.nc_radar import NcRadar
from cloudnetpy.metadata import MetaData
from cloudnetpy import concat_lib
from cloudnetpy.exceptions import ValidTimeStampError
from cloudnetpy.instruments.instruments import MIRA35
from cloudnetpy.instruments import general


def mira2nc(raw_mira: str,
            output_file: str,
            site_meta: dict,
            uuid: Optional[str] = None,
            date: Optional[str] = None) -> str:
    """Converts METEK MIRA-35 cloud radar data into Cloudnet Level 1b netCDF file.

    This function converts raw MIRA file(s) into a much smaller file that
    contains only the relevant data and can be used in further processing
    steps.

    Args:
        raw_mira: Filename of a daily MIRA .mmclx file. Can be also a folder containing several
            non-concatenated .mmclx files from one day.
        output_file: Output filename.
        site_meta: Dictionary containing information about the site. Required key value pair
            is `name`.
        uuid: Set specific UUID for the file.
        date: Expected date as YYYY-MM-DD of all profiles in the file.

    Returns:
        UUID of the generated file.

    Raises:
        ValidTimeStampError: No valid timestamps found.

    Examples:
          >>> from cloudnetpy.instruments import mira2nc
          >>> site_meta = {'name': 'Vehmasmaki'}
          >>> mira2nc('raw_radar.mmclx', 'radar.nc', site_meta)
          >>> mira2nc('/one/day/of/mira/mmclx/files/', 'radar.nc', site_meta)

    """
    keymap = {'Zg': 'Zh',
              'VELg': 'v',
              'RMSg': 'width',
              'LDRg': 'ldr',
              'SNRg': 'SNR',
              'elv': 'elevation',
              'nfft': 'nfft',
              'nave': 'nave',
              'prf': 'prf',
              'rg0': 'rg0'
              }

    if os.path.isdir(raw_mira):
        temp_file = NamedTemporaryFile()
        mmclx_filename = temp_file.name
        valid_filenames = utils.get_sorted_filenames(raw_mira, '.mmclx')
        valid_filenames = general.get_files_with_common_range(valid_filenames)
        variables = list(keymap.keys())
        concat_lib.concatenate_files(valid_filenames, mmclx_filename, variables=variables)
    else:
        mmclx_filename = raw_mira

    mira = Mira(mmclx_filename, site_meta)
    mira.init_data(keymap)
    if date is not None:
        mira.screen_time(date)
        mira.date = date.split('-')
    general.linear_to_db(mira, ('Zh', 'ldr', 'SNR'))
    mira.screen_by_snr()
    mira.mask_invalid_data()
    mira.add_time_and_range()
    general.add_site_geolocation(mira)
    general.add_radar_specific_variables(mira)
    general.add_zenith_angle(mira)
    general.add_height(mira)
    mira.close()
    attributes = output.add_time_attribute(ATTRIBUTES, mira.date)
    output.update_attributes(mira.data, attributes)
    uuid = output.save_level1b(mira, output_file, uuid)
    return uuid


class Mira(NcRadar):
    """Class for MIRA-35 raw radar data. Child of NcRadar().

    Args:
        full_path: Filename of a daily MIRA .mmclx NetCDF file.
        site_meta: Site properties in a dictionary. Required keys are: `name`.

    """
    epoch = (1970, 1, 1)

    def __init__(self, full_path: str, site_meta: dict):
        super().__init__(full_path, site_meta)
        self.date = self._init_mira_date()
        self.instrument = MIRA35

    def screen_time(self, expected_date: str) -> None:
        """Screens incorrect time stamps."""
        time_stamps = self.getvar('time')
        inds = []
        for ind, timestamp in enumerate(time_stamps):
            date = '-'.join(utils.seconds2date(timestamp, self.epoch)[:3])
            if date == expected_date:
                inds.append(ind)
        if not inds:
            raise ValidTimeStampError
        n_time = len(time_stamps)
        for key, cloudnet_array in self.data.items():
            array = cloudnet_array.data
            if not utils.isscalar(array) and array.shape[0] == n_time:
                if array.ndim == 1:
                    cloudnet_array.data = array[inds]
                elif array.ndim == 2:
                    cloudnet_array.data = array[inds, :]
        self.time = self.time[inds]

    def screen_by_snr(self, snr_limit: Optional[float] = -17) -> None:
        """Screens by SNR."""
        ind = np.where(self.data['SNR'][:] < snr_limit)
        for cloudnet_array in self.data.values():
            if cloudnet_array.data.ndim == 2:
                cloudnet_array.mask_indices(ind)

    def mask_invalid_data(self) -> None:
        """Makes sure Z and v masks are also in other 2d variables."""
        z_mask = self.data['Zh'][:].mask
        v_mask = self.data['v'][:].mask
        for cloudnet_array in self.data.values():
            if cloudnet_array.data.ndim == 2:
                cloudnet_array.mask_indices(z_mask)
                cloudnet_array.mask_indices(v_mask)

    def _init_mira_date(self) -> List[str]:
        time_stamps = self.getvar('time')
        return utils.seconds2date(time_stamps[0], self.epoch)[:3]


ATTRIBUTES = {
    'SNR': MetaData(
        long_name='Signal-to-noise ratio',
        units='dB',
    ),
    'nfft': MetaData(
        long_name='Number of FFT points',
        units="1",
    ),
    'nave': MetaData(
        long_name='Number of spectral averages (not accounting for overlapping FFTs)',
        units="1",
    ),
    'rg0': MetaData(
        long_name='Number of lowest range gates',
        units="1"
    ),
    'prf': MetaData(
        long_name='Pulse Repetition Frequency',
        units="Hz",
    ),
}
