#!/bin/env python3
"""
author: Daniel Kříž
login:  xkrizd03
e-mail: xkrizd03@vutbr.cz

DataDriver.py contains the DataDriver class, which implements is simply entry
point for all the data drivers in the application. By data driver I mean an
API for corresponding application data.
"""


from drivers.reflect import ReflectDriver
from drivers.daily import DailyDriver
from drivers.emotions import EmotionsDriver
# from drivers.journal import JournalDriver
# from drivers.links import LinksDriver
from drivers.quotes import QuotesDriver
# from drivers.settings import SettingsDriver
from drivers.prevention import PreventionDriver

class DataDriver():
    """
    DataDriver: composes of other data drivers
    """

    def __init__(self):
        # each of these works with some data class
        self.daily = DailyDriver()
        self.reflect = ReflectDriver()
        self.emotions = EmotionsDriver()
        # self.journal = JournalDriver()
        # self.links = LinksDriver()
        self.quotes = QuotesDriver()
        # self.settings = SettingsDriver()
        self.prevention = PreventionDriver()
