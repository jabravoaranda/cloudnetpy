"""Module for reading and processing Vaisala / Lufft ceilometers."""
import linecache
from typing import Union, Optional
import netCDF4
from cloudnetpy.instruments.lufft import LufftCeilo
from cloudnetpy.instruments.cl61d import Cl61d
from cloudnetpy.instruments.vaisala import ClCeilo, Ct25k
from cloudnetpy import utils, output
from cloudnetpy.metadata import MetaData


def ceilo2nc(full_path: str,
             output_file: str,
             site_meta: dict,
             keep_uuid: Optional[bool] = False,
             uuid: Optional[str] = None,
             date: Optional[str] = None) -> str:
    """Converts Vaisala / Lufft ceilometer data into Cloudnet Level 1b netCDF file.

    This function reads raw Vaisala (CT25k, CL31, CL51, CL61-D) and Lufft (CHM15k)
    ceilometer files and writes the data into netCDF file. Three variants
    of the attenuated backscatter are saved in the file:

        1. Raw backscatter, `beta_raw`
        2. Signal-to-noise screened backscatter, `beta`
        3. SNR-screened backscatter with smoothed weak background, `beta_smooth`

    With CL61-D `beta_raw` is not saved due to large file size. Instead, two dditional
    depolarisation parameters are saved:

        1. Signal-to-noise screened depolarisation, `depolarisation`
        2. SNR-screened depolarisation with smoothed weak background, `depolarisation_smooth`

    Args:
        full_path: Ceilometer file name. For Vaisala it is a text file, for CHM15k it is
            a netCDF file.
        output_file: Output file name, e.g. 'ceilo.nc'.
        site_meta: Dictionary containing information about the site and instrument.
            Required key value pairs are `name` and `altitude` (metres above mean sea level).
            Also 'calibration_factor' is recommended because the default value is probably
            incorrect.
        keep_uuid: If True, keeps the UUID of the old file, if that exists. Default is False
            when new UUID is generated.
        uuid: Set specific UUID for the file.
        date: Expected date as YYYY-MM-DD of all profiles in the file.

    Returns:
        UUID of the generated file.

    Raises:
        RuntimeError: Failed to read or process raw ceilometer data.

    Examples:
        >>> from cloudnetpy.instruments import ceilo2nc
        >>> site_meta = {'name': 'Mace-Head', 'altitude': 5}
        >>> ceilo2nc('vaisala_raw.txt', 'vaisala.nc', site_meta)
        >>> site_meta = {'name': 'Juelich', 'altitude': 108, 'calibration_factor': 2.3e-12}
        >>> ceilo2nc('chm15k_raw.nc', 'chm15k.nc', site_meta)

    """
    snr_limit = 5
    snr_limit_depol = 3
    ceilo_obj = _initialize_ceilo(full_path, date)
    calibration_factor = site_meta.get('calibration_factor', None)
    ceilo_obj.read_ceilometer_file(calibration_factor)
    ceilo_obj.data['beta'] = ceilo_obj.calc_screened_product(ceilo_obj.data['beta_raw'], snr_limit)
    ceilo_obj.data['beta_smooth'] = ceilo_obj.calc_beta_smooth(ceilo_obj.data['beta'], snr_limit)
    if 'cl61' in ceilo_obj.model.lower():
        ceilo_obj.data['depolarisation'] = ceilo_obj.calc_depol(snr_limit_depol)
        ceilo_obj.remove_raw_data()
    ceilo_obj.screen_depol()
    ceilo_obj.prepare_data(site_meta)
    ceilo_obj.prepare_metadata()
    ceilo_obj.data_to_cloudnet_arrays()
    attributes = output.add_time_attribute(ATTRIBUTES, ceilo_obj.metadata['date'])
    output.update_attributes(ceilo_obj.data, attributes)
    for key in ('beta', 'beta_smooth'):
        ceilo_obj.add_snr_info(key, snr_limit)
    ceilo_obj.add_snr_info('depolarisation', snr_limit_depol)
    ceilo_obj.metadata['name'] = site_meta['name']
    return save_ceilo(ceilo_obj, output_file, keep_uuid, uuid)


def _initialize_ceilo(full_path: str,
                      date: Optional[str] = None) -> Union[ClCeilo, Ct25k, LufftCeilo, Cl61d]:
    model = _find_ceilo_model(full_path)
    if model == 'cl31_or_cl51':
        return ClCeilo(full_path, date)
    if model == 'ct25k':
        return Ct25k(full_path, date)
    if model == 'cl61d':
        return Cl61d(full_path, date)
    return LufftCeilo(full_path, date)


def _find_ceilo_model(full_path: str) -> str:
    try:
        nc = netCDF4.Dataset(full_path)
        title = nc.title
        nc.close()
        for identifier in ['cl61d', 'cl61-d']:
            if identifier in title.lower() or identifier in full_path.lower():
                return 'cl61d'
        return 'chm15k'
    except OSError:
        line = ''
        first_empty_line = utils.find_first_empty_line(full_path)
        max_number_of_empty_lines = 10
        for n in range(1, max_number_of_empty_lines):
            line = linecache.getline(full_path, first_empty_line + n)
            if not utils.is_empty_line(line):
                line = linecache.getline(full_path, first_empty_line + n + 1)
                break
        if 'CL' in line:
            return 'cl31_or_cl51'
        if 'CT' in line:
            return 'ct25k'
    raise RuntimeError('Error: Unknown ceilo model.')


def save_ceilo(ceilo: any,
               output_file: str,
               keep_uuid: bool,
               uuid: Union[str, None]) -> str:
    dims = {key: len(ceilo.data[key][:]) for key in ('time', 'range')}
    file_type = 'lidar'
    rootgrp = output.init_file(output_file, dims, ceilo.data, keep_uuid, uuid)
    uuid = rootgrp.file_uuid
    output.add_file_type(rootgrp, file_type)
    rootgrp.title = f"{file_type.capitalize()} file from {ceilo.metadata['name']}"
    rootgrp.year, rootgrp.month, rootgrp.day = ceilo.metadata['date']
    rootgrp.location = ceilo.metadata['name']
    rootgrp.history = f"{utils.get_time()} - {file_type} file created"
    rootgrp.source = ceilo.metadata['source']
    output.add_references(rootgrp)
    rootgrp.close()
    return uuid


ATTRIBUTES = {
    'depolarisation': MetaData(
        long_name='Lidar volume linear depolarisation ratio',
        units='1',
        comment='SNR-screened lidar volume linear depolarisation ratio at 910.55 nm.'
    ),
    'scale': MetaData(
        long_name='Scale',
        units='%',
        comment='100 (%) is normal.'
    ),
    'software_level': MetaData(
        long_name='Software level ID',
        units='1',
    ),
    'laser_temperature': MetaData(
        long_name='Laser temperature',
        units='C',
    ),
    'window_transmission': MetaData(
        long_name='Window transmission estimate',
        units='%',
    ),
    'laser_energy': MetaData(
        long_name='Laser pulse energy',
        units='%',
    ),
    'background_light': MetaData(
        long_name='Background light',
        units='mV',
        comment='Measured at internal ADC input.'
    ),
    'backscatter_sum': MetaData(
        long_name='Sum of detected and normalized backscatter',
        units='sr-1',
        comment='Multiplied by scaling factor times 1e4.',
    ),
    'range_resolution': MetaData(
        long_name='Range resolution',
        units='m',
    ),
    'number_of_gates': MetaData(
        long_name='Number of range gates in profile',
        units='1',
    ),
    'unit_id': MetaData(
        long_name='Ceilometer unit number',
        units='1',
    ),
    'message_number': MetaData(
        long_name='Message number',
        units='1',
    ),
    'message_subclass': MetaData(
        long_name='Message subclass number',
        units='1',
    ),
    'detection_status': MetaData(
        long_name='Detection status',
        units='1',
        comment='From the internal software of the instrument.'
    ),
    'warning': MetaData(
        long_name='Warning and Alarm flag',
        units='1',
        definition=('\n'
                    'Value 0: Self-check OK\n'
                    'Value W: At least one warning on\n'
                    'Value A: At least one error active.')
    ),
    'warning_flags': MetaData(
        long_name='Warning flags',
        units='1',
    ),
    'receiver_sensitivity': MetaData(
        long_name='Receiver sensitivity',
        units='%',
        comment='Expressed as % of nominal factory setting.'
    ),
    'window_contamination': MetaData(
        long_name='Window contamination',
        units='mV',
        comment='Measured at internal ADC input.'
    ),
    'calibration_factor': MetaData(
        long_name='Attenuated backscatter calibration factor',
        units='1',
        comment='Calibration factor applied.'
    ),
}
