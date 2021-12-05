import json

class PreventionDriver():

    def __init__(self):
        self.filename = '../data/prevention.json'

    def get(self, country_code):
        file = open(self.filename)
        data = json.load(file)
        file.close()

        for line in data['lines']:
            if line['country'] == country_code:
                return line

    def get_all(self):
        file = open(self.filename)
        data = json.load(file)
        file.close()
        return data['lines']

