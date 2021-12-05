<template>

<div class="unscrollable">
    <v-container justify-center>
        <v-layout row wrap
            justify="center">
            <v-flex xs12> 
            <v-card
                class="ma-3"
                elevation="8"
                shaped
                outlined
                color="#3DAF7B"
                dark
                min-width="75%"
            >
                <v-card-title>
                    <span class="text-h4 font-weight-bold">Hello, how are you today?</span>
                </v-card-title>

            <v-row align="center" justify="center">
                <v-card-actions style="margin-bottom: 0.8em;">
                <v-list-item class="grow">
            <!-- @click="TODO" -->
                    <v-btn class="ma-2"
                            text
                            icon>
                        <v-icon class="mr-1" x-large @click="ratingClicked(1)">
                            mdi-emoticon-frown-outline
                        </v-icon>
                    </v-btn>

                    <v-btn class="ma-2"
                        text
                        icon>
                    <v-icon class="mr-1" x-large @click="ratingClicked(2)">
                        mdi-emoticon-sad-outline
                    </v-icon>
                    </v-btn> 

                        <v-btn class="ma-2"
                        text
                        icon>
                    <v-icon class="mr-1" x-large @click="ratingClicked(3)">
                        mdi-emoticon-neutral-outline
                    </v-icon>
                        </v-btn>
                            <v-btn class="ma-2"
                        text
                        icon>
                    <v-icon class="mr-1" x-large @click="ratingClicked(4)">
                        mdi-emoticon-happy-outline 
                    </v-icon>
                            </v-btn>
                                <v-btn class="ma-2"
                        text
                        icon>
                    <v-icon class="mr-1" x-large @click="ratingClicked(5)">
                        mdi-emoticon-excited-outline
                    </v-icon>
                                </v-btn>
                </v-list-item>
                </v-card-actions>
            </v-row>
        </v-card>
        </v-flex>
        </v-layout>

<v-layout row justify="center" justify-space-between > 
<v-flex xs12> 
        <v-card
            class="ma-3"
            elevation="8"
            outlined
            color="#3DAF7B"
            dark
            min-width="75%">

        <!-- <span class="text-h5 font-weight">What made you feel this way?</span> -->

        <v-textarea
            class="text-4 font-weight-bold ma-5"
            label="What made you feel this way?"
            id="feelingTextArea"
            multi-line 
        ></v-textarea>

            <v-card-actions>
      <v-list-item class="grow">
        <v-row
          align="center"
          justify="end"
        >
        <v-btn @click=reasonClicked>
          <v-icon class="mr-1">
            mdi-send-outline
          </v-icon>
            SAVE 
        </v-btn>
    </v-row>


    </v-list-item>
    </v-card-actions>

    </v-card>
</v-flex>
        </v-layout>

        <v-layout row wrap
            justify="center">
            <v-flex xs12> 
                <v-img style="opacity:0.3;"
                 :src="require('@/assets/undraw_handcrafts_planet.svg')"
                 size="50%"
                 class="imag"
                ></v-img>

            </v-flex>
        </v-layout>


</v-container>
</div>

</template> 

<script>
  import FeelingRecordsService from "../../services/FeelingRecordsService";

  export default {
    name: 'MainPage',

    data: () => ({
        record: {
            feelingRate: null,
            feelingReason: null,
            date: null,
        },
    }),

    methods: {
        ratingClicked(value) {
            this.record.feelingRate = value;
            this.getTodayDate();
        },

        reasonClicked() {
            // At this point, we expect that this.record has already filled feeling rate.
            this.record.feelingReason = document.getElementById("feelingTextArea").value;
            this.record.date = this.getTodayDate();

            var fs = require('fs');
            
            let jsonFile = FeelingRecordsService.getAll();
            
            console.log(jsonFile);
            jsonFile.feelingRecords.push(JSON.parse(JSON.stringify(this.record)));
            console.log(jsonFile);
            
            jsonFile = JSON.stringify(jsonFile);
            fs.writeFile('../data/feelingRecords.json', jsonFile, function (err) {
                console.log(err);
            }); // write it back
        },

        getTodayDate() {            
            let today = new Date();
            
            let year = today.getFullYear();
            year = year.toString();
            year = year.slice(2);

            return today.getDate() + '/' + (today.getMonth() + 1) + '/' + year;
        }
    },
  }
</script>

<style scoped>
    html, body {margin: 0; height: 100%; overflow: hidden};
</style>