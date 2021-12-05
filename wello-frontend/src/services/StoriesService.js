class StoriesService {
    getAll() {
      return require('../data/stories.json');
    }
  
    get(id) {
      let jsonFile = require('../data/stories.json');
      return jsonFile.stories[id];
    }

    getNumberOfRecords() {
      let jsonFile = require('../data/stories.json');
      return jsonFile.stories.length;
    }
  }
  
  export default new StoriesService();