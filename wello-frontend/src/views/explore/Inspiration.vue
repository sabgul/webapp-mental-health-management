<template>
<v-container>
    <v-row align="center" justify="center">
        <!-- <v-card
        elevation="12"
        outlined
        shaped
        width="75%">
            <v-card-title color="#3DAF7B">Highlight</v-card-title>
            <v-card-text >"This is some random fucking bullshit supposed to be a placeholder."</v-card-text>
            <v-card-text>-Author</v-card-text>
        <v-card-actions class="justify-center">
            <v-btn
                class="mx-2"
                fab
                dark
                small
                color="#3DAF7B"
            >
                <v-icon dark>
                    mdi-heart
                </v-icon>
            </v-btn>
        </v-card-actions>
    </v-card> -->

    <v-card
    class="mx-auto"
    elevation="8"
    shaped
    outlined
    color="#3DAF7B"
    dark
    max-width="75%"
  >
    <v-card-title>
      <v-icon
        large
        left
      >
        mdi-lightbulb-on-outline
      </v-icon>
      <span class="text-h6 font-weight-bold">Highlight</span>
    </v-card-title>

    <v-card-text class="text-h5 font-weight-bold">
      "Turns out semicolon-less style is easier and safer in TS because most gotcha edge cases are type invalid as well."
    </v-card-text>

    <v-card-actions>
      <v-list-item class="grow">

        <v-list-item-content>
          <v-list-item-title>-Evan You</v-list-item-title>
        </v-list-item-content>

        <v-row
          align="center"
          justify="end"
        >
          <v-icon class="mr-1">
            mdi-heart
          </v-icon>
          <span class="subheading mr-2">256</span>
          
    </v-row>


    </v-list-item>
    </v-card-actions>
  </v-card>
    </v-row>

<v-row align="center" justify="center">
    CARousel comes here
</v-row>

</v-container>
</template>

<script>
  export default {
    name: 'Inspiration',

    data: () => ({
    }),

    methods: {
    },
  }
</script>