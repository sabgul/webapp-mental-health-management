import json
import random

class ReflectDriver():

    def __init__(self):
        self.filename = '../data/reflect.json'


    def get_random(self):
        file = open(self.filename)
        data = json.load(file)
        random_idx = random.randrange(len(data['questions']))
        random_reflect = data['questions'][random_idx]
        return (random_reflect['id'], random_reflect['body'])
