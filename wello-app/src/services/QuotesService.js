class QuotesService {
    getAll() {
      return require('../data/quotes.json');
    }
  
    get(id) {
      let jsonFile = require('../data/quotes.json');
      return jsonFile.quotes[id];
    }

    getNumberOfQuotes() {
      let jsonFile = require('../data/quotes.json');
      return jsonFile.quotes.length;
    }
  }
  
  export default new QuotesService();