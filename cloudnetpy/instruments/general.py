"""General helper functions for instrument processing."""
import logging

import netCDF4
import numpy as np
from numpy import ma

from cloudnetpy import CloudnetArray


def add_site_geolocation(obj):
    """Adds site geolocation."""
    for key in ("latitude", "longitude", "altitude"):
        value = None
        # User-supplied:
        if key in obj.site_meta:
            value = obj.site_meta[key]
        # From source global attributes (MIRA):
        elif hasattr(obj, "dataset") and hasattr(obj.dataset, key.capitalize()):
            value = float(getattr(obj.dataset, key.capitalize()).split()[0])
        # From source data (BASTA / RPG):
        elif hasattr(obj, "dataset") and key in obj.dataset.variables:
            value = obj.dataset.variables[key][:]
        if value is not None:
            value = float(ma.mean(value))
            obj.data[key] = CloudnetArray(value, key)


def add_radar_specific_variables(obj):
    """Adds radar specific variables."""
    key = "radar_frequency"
    obj.data[key] = CloudnetArray(obj.instrument.frequency, key)
    try:
        possible_nyquist_names = ("ambiguous_velocity", "NyquistVelocity")
        data = obj.getvar(*possible_nyquist_names)
        key = "nyquist_velocity"
        obj.data[key] = CloudnetArray(np.array(data), key)
    except RuntimeError:
        logging.warning("Unable to find nyquist_velocity")


def linear_to_db(obj, variables_to_log: tuple) -> None:
    """Changes linear units to logarithmic."""
    for name in variables_to_log:
        obj.data[name].lin2db()


def get_files_with_common_range(files: list) -> list:
    """Returns files with the same (most common) number of range gates."""
    n_range = []
    for file in files:
        with netCDF4.Dataset(file) as nc:
            n_range.append(len(nc.variables["range"]))
    most_common = np.bincount(n_range).argmax()
    n_removed = len([n for n in n_range if n != most_common])
    if n_removed > 0:
        logging.warning(f"Removing {n_removed} MIRA files due to inconsistent height vector")
    ind = np.where(n_range == most_common)[0]
    return [file for i, file in enumerate(files) if i in ind]
