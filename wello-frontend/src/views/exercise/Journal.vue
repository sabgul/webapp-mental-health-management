<template>
    <v-container>
        <v-row>

<!-- Text input  -->
        <v-col  align="center" justify="center">
           <v-form>
    <v-container  align="center" justify="center">
      <v-row>
          <v-text-field
          shaped
            label="What day is it?"
            solo
          ></v-text-field>
      </v-row>
     <v-row>
          <v-textarea
            label="What's on your mind?"
            solo
            height="500"
            multi-line
        >
    
        <v-btn>
          <v-icon class="mr-1">
            mdi-send-outline
          </v-icon>
            SAVE 
        </v-btn>
        </v-textarea>
    
      </v-row>

      <v-row>
          <v-img
          :src="require('@/assets/undraw_road_to_knowledge_m8s0.svg')"
          width="15"
          >

          </v-img>

      </v-row>
    </v-container>
  </v-form>
        </v-col>

<!-- Scrollable timeline -->
        <v-col>
        <v-card elevation="8"
            shaped
            outlined>
        <v-timeline>
    <v-timeline-item
      v-for="(year, i) in years"
      :key="i"
      :color="year.color"
      small
    >
      <template v-slot:opposite>
        <span
          :class="`headline font-weight-bold ${year.color}--text`"
          v-text="year.year"
        ></span>
      </template>
      <div class="py-4">
        <h2 :class="`headline font-weight-light mb-4 ${year.color}--text`">
          Lorem ipsum
        </h2>
        <div>
          Lorem ipsum dolor sit amet, no nam oblique veritus. Commune scaevola imperdiet nec ut, sed euismod convenire principes at. Est et nobis iisque percipit, an vim zril disputando voluptatibus, vix an salutandi sententiae.
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
  export default {
    name: 'Journal',

    data: () => ({
      years: [
        {
          color: '#C3EAD8',
          year: '1/12/21',
        },
        {
          color: '#A4DFC4',
          year: '28/11/21',
        },
        {
          color: '#77CFA8',
          year: '12/11/21',
        },
        {
          color: '#4ABF8A',
          year: '23/10/21',
        },
        {
          color: '#3DAF7B',
          year: '5/10/21',
        },
      ],
    }),
  }
</script>

