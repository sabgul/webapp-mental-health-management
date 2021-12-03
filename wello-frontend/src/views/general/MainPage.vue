<template>

<div>
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
                <v-card-actions>
                <v-list-item class="grow">
            <!-- @click="TODO" -->
                    <v-btn class="ma-2"
                            text
                            icon>
                        <v-icon class="mr-1" x-large>
                            mdi-emoticon-frown-outline
                        </v-icon>
                    </v-btn>

                    <v-btn class="ma-2"
                        text
                        icon>
                    <v-icon class="mr-1" x-large>
                        mdi-emoticon-sad-outline
                    </v-icon>
                    </v-btn> 

                        <v-btn class="ma-2"
                        text
                        icon>
                    <v-icon class="mr-1" x-large>
                        mdi-emoticon-neutral-outline
                    </v-icon>
                        </v-btn>
                            <v-btn class="ma-2"
                        text
                        icon>
                    <v-icon class="mr-1" x-large>
                        mdi-emoticon-happy-outline 
                    </v-icon>
                            </v-btn>
                                <v-btn class="ma-2"
                        text
                        icon>
                    <v-icon class="mr-1" x-large>
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
            multi-line 
        ></v-textarea>

            <v-card-actions>
      <v-list-item class="grow">
        <v-row
          align="center"
          justify="end"
        >
        <v-btn>
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
                ></v-img>

            </v-flex>
        </v-layout>


</v-container>
</div>

</template> 

<script>
  export default {
    name: 'MainPage',

    data: () => ({
    }),

    methods: {
    },
  }
</script>