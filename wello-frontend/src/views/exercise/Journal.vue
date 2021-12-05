<template>
<v-container>
    <v-row>

<!-- Text input  -->
    <v-col  align="center" justify="center">
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
                    <span class="text-h4 font-weight-bold">Journal note for {{getTodayDate()}}</span>
                </v-card-title>

            <v-row align="center" justify="center">
            <v-textarea
                class="text-4 font-weight-bold ma-5"
                label="Today's entry"
                id="feelingTextArea"
                multi-line
                v-model="todaysEntry"
            ></v-textarea>
    </v-row>
    </v-card>
     <v-row>
          <v-img
          :src="require('@/assets/undraw_road_to_knowledge_m8s0.svg')"
          width="15"
          ></v-img>
      </v-row>
     </v-col>

        <v-col>
        <v-card elevation="8"
            shaped
            outlined>
        <v-timeline>

    <v-timeline-item
      color="#3DAF7B"
      small
    >
      <template v-slot:opposite>
        <span
          :class="`headline font-weight-bold #3DAF7B--text`"
          v-text="getTodayDate()"
        ></span>
      </template>
      <div class="py-4">
        <div>
         {{todaysEntry}}  
         </div>
      </div>
    </v-timeline-item>

    <v-timeline-item
      v-for="(entry, i) in entries.journalRecords"
      :key="i"
      color="#3DAF7B"
      small
    >
      <template v-slot:opposite>
        <span
          :class="`headline font-weight-bold #3DAF7B--text`"
          v-text="entry.date"
        ></span>
      </template>
      <div class="py-4">
        <div>
        {{entry.text}}    
         </div>
      </div>
    </v-timeline-item>
  </v-timeline>
            </v-card>
        </v-col>
        </v-row>
    </v-container>
</template>

<script>
  import JournalRecordsService from "../../services/JournalRecordsService"; 

  export default {
    name: 'Journal',

    data: () => ({
      date: null,
      entries: null,

      todaysEntry: "",
    }),

    methods: {
        getTodayDate() {            
            let today = new Date();
            
            let year = today.getFullYear();
            year = year.toString();
            year = year.slice(2);

            return today.getDate() + '/' + (today.getMonth() + 1) + '/' + year;
        },

        getEntries: function() {
            this.entries = JournalRecordsService.getAll();
        }
    },

    beforeMount() {
        this.getEntries()
    }
  }
</script>

