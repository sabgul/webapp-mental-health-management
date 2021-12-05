#!/bin/env python3
"""
author: Daniel Kříž
login:  xkrizd03
e-mail: xkrizd03@vutbr.cz

emotions.py contains the EmotionsDriver class, which is responsible for
operations with emotions data storage.
"""

import json
import datetime

HORRIBLE=0
BAD=1
NORMAL=2
GOOD=3
EXCELENT=4

class EmotionsDriver():
    """
    EmotionsDriver: implements API for accessing the emotions data
    """

    def __init__(self, filename='../data/emotions.json'):
        self.filename = filename


    def set(self, emotion: int):
        """
        set: simply sets the emotions for todays date
        """
        file = open(self.filename)
        data = json.load(file)
        file.close()

        is_new = True
        for dict in data['emotions']:
            if dict['date'] == datetime.date.today:
                dict['emotion'] = emotion
                is_new = False
                break

        with open(self.filename, 'w') as file:
            if is_new:
                data.append({'emotion': emotion, 'date': datetime.date.today})
            out = json.dumps(data, indent=2)
            file.write(out)


    def get(self, date=datetime.date.today()):
        """
        get: gets emotions value of the 'date'
        """
        file = open(self.filename)
        data = json.load(file)
        for dict in data['emotions']:
            if dict['date'] == date:
                return dict['emotion']
        return None
