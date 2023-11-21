"""Mwr module, containing the :class:`Mwr` class."""
import logging

import numpy as np
from numpy import ma
from scipy.interpolate import interp1d

from cloudnetpy.categorize.lidar import get_gap_ind
from cloudnetpy.datasource import DataSource


class Disdrometer(DataSource):
    """Disdrometer class, child of DataSource.

    Args:
    ----
         full_path: Cloudnet Level 1b disdrometer file.

    """

    def __init__(self, full_path: str):
        super().__init__(full_path)
        self._init_rainfall_rate()

    def interpolate_to_grid(self, time_grid: np.ndarray) -> None:
        for key, array in self.data.items():
            self.data[key].data = self._interpolate(array.data, time_grid)

    def _init_rainfall_rate(self) -> None:
        keys = ("rainfall_rate", "n_particles")
        for key in keys:
            self.append_data(self.dataset.variables[key][:], key)

    def _interpolate(self, y: ma.MaskedArray, x_new: np.ndarray) -> np.ndarray:
        if ma.getmask(y) is ma.nomask:
            non_masked_indices = np.arange(len(y))
        elif y.mask.all():
            return ma.masked_all(x_new.shape)
        else:
            non_masked_indices = np.where(~y.mask)[0]
        non_masked_values = y[non_masked_indices]
        non_masked_time = self.time[non_masked_indices]
        fun = interp1d(non_masked_time, non_masked_values, fill_value="extrapolate")
        interpolated_array = ma.array(fun(x_new))
        max_time = 1 / 60  # min -> fraction hour
        mask_ind = get_gap_ind(non_masked_time, x_new, max_time)

        if len(mask_ind) > 0:
            msg = f"Unable to interpolate disdrometer for {len(mask_ind)} time steps"
            logging.warning(msg)
            interpolated_array[mask_ind] = ma.masked

        return interpolated_array
