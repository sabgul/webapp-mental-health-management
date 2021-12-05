class JournalRecordsService {
    getAll() {
      return require('../data/journalRecords.json');
    }
  
    get(id) {
      let jsonFile = require('../data/journalRecords.json');
      return jsonFile.journalRecords[id];
    }

    getNumberOfRecords() {
      let jsonFile = require('../data/journalRecords.json');
      return jsonFile.journalRecords.length;
    }
  }
  
  export default new JournalRecordsService();