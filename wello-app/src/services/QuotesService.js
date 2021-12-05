/* 
*
* Author:       Sabina Gulcikova
*         xgulci00@stud.fit.vutbr.cz
* Date:            03/12/21 
*
*/

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