<!-- ------------------------------------
Author:     Sabina Gulcikova 
         xgulci00@stud.fit.vutbr.cz
Date:           3/12/21 
------------------------------------- -->
<template>
  <div>
    <v-container justify-center>
      <v-layout row wrap justify="center">
        <v-flex>
          <v-card
            class="ma-3 text-center"
            color="#3DAF7B"
            dark
            elevation="8"
            shaped
            outlined
            min-width="90%"
          >
            <v-card-text>
              <v-sheet color="rgba(0, 0, 0, .12)">
                <v-sparkline
                  :labels="labels"
                  :value="value"
                  color="rgba(255, 255, 255, .7)"
                  label-size="5"
                  padding="24"
                  stroke-linecap="round"
                  smooth
                ></v-sparkline>
              </v-sheet>
            </v-card-text>

            <v-card-text>
              <div class="text-h6 font-weight-bold">How you felt over last few entries</div>
            </v-card-text>
          </v-card>
        </v-flex>
      </v-layout>

      <v-layout row justify="center" justify-space-between>
        <v-flex>
          <v-card class="ma-3" color="#3DAF7B" dark elevation="8" outlined min-width="75%">
            <v-card-title>
              <v-icon large left>mdi-airplane-takeoff</v-icon>
              <span class="text-h6 font-weight-bold">What caused highs:</span>
            </v-card-title>

            <v-card-text>
              <v-list color="#3DAF7B">
                <v-list-item v-for="(el_texto, i) in highs" :key="i">
                  <v-icon left>mdi-circle-small</v-icon>
                  <span class="text-h8 font-weight-bold">{{el_texto}}</span>
                </v-list-item>
              </v-list>
            </v-card-text>
          </v-card>
        </v-flex>
      </v-layout>

      <v-layout row justify="center" justify-space-between>
        <v-flex>
          <v-card class="ma-3" color="#3DAF7B" dark elevation="8" outlined min-width="75%">
            <v-card-title>
              <v-icon large left>mdi-airplane-landing</v-icon>

              <span class="text-h6 font-weight-bold">What caused lows:</span>
            </v-card-title>

            <v-card-text>
              <v-list color="#3DAF7B">
                <v-list-item v-for="(el_texto, i) in lows" :key="i">
                  <v-icon left>mdi-circle-small</v-icon>
                  <span class="text-h8 font-weight-bold">{{el_texto}}</span>
                </v-list-item>
              </v-list>
            </v-card-text>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
import { db } from '@/main';
// import FeelingRecordsService from "../../services/FeelingRecordsService";

export default {
  name: "Trends",

  data: () => ({
    records: null,

    labels: [],
    value: [],

    highs: [],
    lows: []
  }),

  methods: {
    async getRecords() {
            let snapShot = await db.collection('feelingRecords').get();       // this returns promise
            let feelingRecords = [];
            // every item from collection is pushed into events array
            snapShot.forEach(doc => {
                let appData = doc.data();
                appData.id = doc.id;
                feelingRecords.push(appData);
            });
            this.records = feelingRecords;

            for (let index = 0; index < this.records.length; index++) {
              this.value.push(this.records[index].feelingRate);
              this.labels.push(this.records[index].date);
            }
    },

    async getHighsRecords() {
            let snapShot = await db.collection('feelingRecords').get();       // this returns promise
            let positiveRecords = [];
            // every item from collection is pushed into events array
            snapShot.forEach(doc => {
                let appData = doc.data();
                appData.id = doc.id;
                if(appData.feelingRate > 3) {
                  positiveRecords.push(appData.feelingReason);
                }
            });
            this.highs = positiveRecords;
    }, 

    async getLowsRecords() {
            let snapShot = await db.collection('feelingRecords').get();       // this returns promise
            let negativeRecords = [];
            // every item from collection is pushed into events array
            snapShot.forEach(doc => {
                let appData = doc.data();
                appData.id = doc.id;
                if(appData.feelingRate < 3) {
                  negativeRecords.push(appData.feelingReason);
                }
            });
            this.lows = negativeRecords;
    },
    

    // getHighsRecords: function() {
    //   this.highs = FeelingRecordsService.getPositiveRecords();
    // },

    // getLowsRecords: function() {
    //   this.lows = FeelingRecordsService.getNegativeRecords();
    // }
  },

  beforeMount() {
    this.getRecords();

    this.getHighsRecords();
    this.getLowsRecords();
  }
};
</script>