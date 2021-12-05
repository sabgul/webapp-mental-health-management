#!/bin/env python3
"""
author: Daniel Kříž
login:  xkrizd03
e-mail: xkrizd03@vutbr.cz

daily_handler.py
"""


class DailyHandler():
    """
    DailyHandler:
    """

    checkboxes = {
        'meditation_morning' : 'daily_morning_meditation_checkbox',
        'meditation_midday' : 'daily_midday_meditation_checkbox',
        'meditation_evening' : 'daily_evening_meditation_checkbox',
        'emotion' : 'daily_emotion_checkbox',
        'reflect' : 'daily_reflection_checkbox',
        'journal' : 'daily_journaling_checkbox',
    }

    def __init__(self, builder, data_driver):
        self.builder = builder
        self.data_driver = data_driver

    def update_daily(self, name):
        self.data_driver.daily.set(name, True)
        checkbox = self.builder.get_object(self.checkboxes[name])
        checkbox.activate()

