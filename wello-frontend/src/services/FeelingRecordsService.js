class FeelingRecordsService {
    getAll() {
      return require('../data/feelingRecords.json');
    }
  
    get(id) {
      let jsonFile = require('../data/feelingRecords.json');
      return jsonFile.feelingRecords[id];
    }

    getNumberOfRecords() {
      let jsonFile = require('../data/feelingRecords.json');
      return jsonFile.feelingRecords.length;
    }

    getPositiveRecords() {
        let jsonFile = require('../data/feelingRecords.json');
        let posFeelings = [];

        for (let index = 0; index < jsonFile.feelingRecords.length; index++) {
            if(jsonFile.feelingRecords[index].feelingRate > 3) {
                posFeelings.push(jsonFile.feelingRecords[index].feelingReason);
            }
        }

        return posFeelings;
    }

    getNegativeRecords() {
        let jsonFile = require('../data/feelingRecords.json');
        let negFeelings = [];

        for (let index = 0; index < jsonFile.feelingRecords.length; index++) {
            if(jsonFile.feelingRecords[index].feelingRate < 3) {
                negFeelings.push(jsonFile.feelingRecords[index].feelingReason);
            }
        }

        return negFeelings;
    }
  }
  
  export default new FeelingRecordsService();