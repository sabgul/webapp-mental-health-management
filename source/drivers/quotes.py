import random
import json

class QuotesDriver():

    def __init__(self):
        self.filename = '../data/quotes.json'

    def get_random(self):
        file = open(self.filename)
        data = json.load(file)
        random_idx = random.randrange(len(data['quotes']))
        random_quote = data['quotes'][random_idx]
        return (random_quote['author'], random_quote['text'])

