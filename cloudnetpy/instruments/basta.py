"""Module for reading / converting BASTA radar data."""
from typing import Optional
import numpy as np
import numpy.ma as ma
from cloudnetpy import output
from cloudnetpy.instruments.nc_radar import NcRadar
from cloudnetpy.metadata import MetaData
from cloudnetpy.instruments import instruments, general


def basta2nc(basta_file: str,
             output_file: str,
             site_meta: dict,
             keep_uuid: Optional[bool] = False,
             uuid: Optional[str] = None,
             date: Optional[str] = None) -> str:
    """Converts BASTA cloud radar data into Cloudnet Level 1b netCDF file.

    This function converts daily BASTA file into a much smaller file that
    contains only the relevant data and can be used in further processing
    steps.

    Args:
        basta_file: Filename of a daily BASTA .nc file.
        output_file: Output filename.
        site_meta: Dictionary containing information about the site. Required key is `name`.
        keep_uuid: If True, keeps the UUID of the old file, if that exists. Default is False
            when new UUID is generated.
        uuid: Set specific UUID for the file.
        date: Expected date of the measurements as YYYY-MM-DD.

    Returns:
        UUID of the generated file.

    Raises:
        ValueError: Timestamps do not match the expected date.

    Examples:
          >>> from cloudnetpy.instruments import basta2nc
          >>> site_meta = {'name': 'Palaiseau', 'latitude': 48.718, 'longitude': 2.207}
          >>> basta2nc('basta_file.nc', 'radar.nc', site_meta)

    """
    keymap = {'reflectivity': 'Zh',
              'velocity': 'v'}

    basta = Basta(basta_file, site_meta)
    basta.init_data(keymap)
    if date is not None:
        basta.validate_date(date)
    basta.screen_data(keymap)
    basta.add_time_and_range()
    general.add_site_geolocation(basta)
    general.add_zenith_angle(basta)
    general.add_radar_specific_variables(basta)
    general.add_height(basta)
    basta.close()
    attributes = output.add_time_attribute(ATTRIBUTES, basta.date)
    output.update_attributes(basta.data, attributes)
    uuid = output.save_level1b(basta, output_file, keep_uuid, uuid)
    return uuid


class Basta(NcRadar):
    """Class for BASTA raw radar data. Child of NcRadar().

    Args:
        full_path: BASTA netCDF filename.
        site_meta: Site properties in a dictionary. Required key is `name`.

    """

    def __init__(self, full_path: str, site_meta: dict):
        super().__init__(full_path, site_meta)
        self.date = self.get_date()
        self.instrument = instruments.BASTA

    def screen_data(self, keymap: dict) -> None:
        """Saves only valid pixels."""
        mask = self.getvar('background_mask')
        for key in keymap.values():
            self.data[key].mask_indices(np.where(mask != 1))

    def validate_date(self, expected_date: str) -> None:
        """Validates expected data."""
        date_units = self.dataset.variables['time'].units
        date = date_units.split()[2]
        if expected_date != date:
            raise ValueError('Basta date not what expected.')


ATTRIBUTES = {}
