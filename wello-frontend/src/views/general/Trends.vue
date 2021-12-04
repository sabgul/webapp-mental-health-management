<template>
<div>
<v-container justify-center>
    <v-layout row wrap justify ="center">
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
        >
        </v-sparkline>
      </v-sheet>
    </v-card-text>

    <v-card-text>
      <div class="text-h6 font-weight-bold">
        How you felt over last few days
      </div>
    </v-card-text>
  </v-card>
    </v-flex>
</v-layout>

    <v-layout row justify ="center" justify-space-between>
        <v-flex>
        <v-card 
    class="ma-3"
    color="#3DAF7B"
    dark
    elevation="8"
        outlined
    min-width="75%">
    <v-card-title>
        <v-icon
        large
        left
        >
            mdi-airplane-takeoff
        </v-icon>
        <span  class="text-h6 font-weight-bold"> What caused highs:</span>
</v-card-title>
    

<v-card-text>
<v-list
color="#3DAF7B">
    <v-list-item>
<v-icon
            left
        >
            mdi-circle-small
        </v-icon>
        <span  class="text-h8 font-weight-bold">had great dinner</span>
    </v-list-item>
    <v-list-item>
<v-icon
            left
        >
            mdi-circle-small
        </v-icon>
        <span  class="text-h8 font-weight-bold">went for a walk with my dog</span>
    </v-list-item>


</v-list>
</v-card-text>
    </v-card>
        </v-flex>
    </v-layout>


    <v-layout row justify ="center" justify-space-between>
        <v-flex>
        <v-card 
    class="ma-3"
    color="#3DAF7B"
    dark
    elevation="8"
    outlined
    min-width="75%">
    <v-card-title>
        <v-icon
            large
            left
            >
                mdi-airplane-landing
            </v-icon>

            <span class="text-h6 font-weight-bold"> What caused lows: </span>
    </v-card-title>

<v-card-text>
<v-list color="#3DAF7B">
    <v-list-item>
<v-icon
            left
        >
            mdi-circle-small
        </v-icon>
        <span  class="text-h8 font-weight-bold">broke my phone</span>
    </v-list-item>
    <v-list-item>
<v-icon
            left
        >
            mdi-circle-small
        </v-icon>
        <span  class="text-h8 font-weight-bold">met my ex</span>
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
  export default {
    name: 'Trends',

    data: () => ({
        labels: [
        '12/08/21',
        '15/08/21',
        '20/09/21',
        '21/09/21',
        '01/11/21',
        '02/11/21',
        '07/11/21',
        '25/11/21',
      ],
      value: [
        5,
        4,
        1,
        1,
        1,
        3,
        5,
        5,
      ],
    }),

    methods: {
    },
  }
</script>