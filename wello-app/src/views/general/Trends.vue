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
                <v-list-item
                  v-for="(el_texto, i) in highs"
                  :key="i">
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
                <v-list-item
                  v-for="(el_texto, i) in lows"
                  :key="i">
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
import FeelingRecordsService from "../../services/FeelingRecordsService";

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
    getRecords: function() {
      this.records = FeelingRecordsService.getAll();
    },

    getHighsRecords: function() {
      this.highs = FeelingRecordsService.getPositiveRecords();
    },

    getLowsRecords: function() {
      this.lows = FeelingRecordsService.getNegativeRecords();
    }
  },

  beforeMount() {
    this.getRecords();

    for (let index = 0; index < this.records.feelingRecords.length; index++) {
      this.value.push(this.records.feelingRecords[index].feelingRate);
      this.labels.push(this.records.feelingRecords[index].date);
    }

    this.getHighsRecords();
    this.getLowsRecords();
  }
};
</script>