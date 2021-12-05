<!-- ------------------------------------
Author:     Sabina Gulcikova 
         xgulci00@stud.fit.vutbr.cz
Date:           3/12/21 
------------------------------------- -->
<template>
  <v-container>
    <v-row align="center" justify="center">
      <v-card
        class="ma-5 padding-3"
        elevation="8"
        shaped
        outlined
        color="#59C594"
        dark
        max-width="75%"
      >
        <v-card-title>
          <v-icon large left>mdi-seatbelt</v-icon>
          <span class="text-h6 font-weight-bold">Safe space</span>
        </v-card-title>

        <v-card-text class="text-h5 font-weight-bold">
          It is important to take your emotions seriously. Whenever you feel like it is necessary, make sure
          to make use of the following resources:
        </v-card-text>

        <v-divider></v-divider>
        <v-card-text class="text-h5 font-weight-bold">Krízová linka pomoci</v-card-text>

        <v-card-text class="text-h7 font-weight-bold">
          <v-icon>mdi-phone</v-icon>0800 500 333
        </v-card-text>
        <v-divider></v-divider>
        <v-card-text class="text-h5 font-weight-bold">IPčko.sk</v-card-text>

        <v-card-text class="text-h7 font-weight-bold">
          <v-btn
            icon
            href="https://ipcko.sk/mapa-pomoci/linky-pomoci/"
            target="_blank"
            style="padding-left: 3.6em;"
          >
            <v-icon>mdi-earth</v-icon>ipcko.sk
          </v-btn>
        </v-card-text>

        <v-divider></v-divider>
        <v-card-text class="text-h5 font-weight-bold">Dobrá linka</v-card-text>

        <v-card-text class="text-h7 font-weight-bold">
          <v-icon>mdi-at</v-icon>poradna@dobralinka.sk
        </v-card-text>

        <v-divider></v-divider>
        <v-card-text class="text-h5 font-weight-bold">Better help</v-card-text>

        <v-card-text class="text-h7 font-weight-bold">
          <v-btn
            icon
            href="https://www.betterhelp.com/"
            target="_blank"
            style="padding-left: 5.7em;"
          >
            <v-icon>mdi-earth</v-icon>betterhelp.com
          </v-btn>
        </v-card-text>

        <v-card-actions>
          <v-list-item class="grow">
            <v-row align="center" justify="center">
              <v-btn href="https://ipcko.sk/mapa-pomoci/linky-pomoci/" target="_blank">
                <v-icon class="mr-1">mdi-chevron-right</v-icon>
                <span class="subheading mr-2">More</span>
              </v-btn>
            </v-row>
          </v-list-item>
        </v-card-actions>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "SafeSpace",

  data: () => ({}),

  methods: {}
};
</script>