#!/bin/env python3
"""
author: Daniel Kříž
login:  xkrizd03
e-mail: xkrizd03@vutbr.cz

daily.py contains the DailyDriver class, which is responsible for operations
with daily data storage.
"""

import json
import datetime


class DailyDriver():
    """
    DailyDriver: implements API for accessing the daily data
    """

    def __init__(self, filename='../data/daily.json'):
        self.filename = filename


    def set_all(self, value: bool):
        """
        set_all: set all values in the daily storage to false,
        this is used when there is another day and we want start the dailies
        over again.
        """
        # NOTE: in this version it is not needed
        pass


    def set(self, key: str, value: bool):
        """
        set: simply sets the value to the corresponding key
        """
        file = open(self.filename)
        data = json.load(file)
        file.close()

        # Application has been run on a new date
        if data['date'] != datetime.date.today():
            self.set_all(False)

        if 'meditation' in key:
            subkey = key.split('_')[1]
            key = key.split('_')[0]
            data[key][subkey] = value
        else:
            data[key] = value

        with open(self.filename, 'w') as file:
            out = json.dumps(data, indent=2)
            file.write(out)
