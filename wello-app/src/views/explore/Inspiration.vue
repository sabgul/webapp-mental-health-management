<!-- ------------------------------------
Author:     Sabina Gulcikova 
         xgulci00@stud.fit.vutbr.cz
Date:           3/12/21 
------------------------------------- -->
<template>
  <v-container>
    <v-layout row wrap justify="center">
      <v-flex style="padding-bottom: 2em;">
        <v-card class="ma-3" elevation="8" shaped outlined color="#3DAF7B" dark min-width="75%">
          <v-card-title>
            <v-icon large left>mdi-lightbulb-on-outline</v-icon>
            <span class="text-h6 font-weight-bold">Highlight</span>
          </v-card-title>

          <v-card-text class="text-h5 font-weight-bold">{{quote.text}}</v-card-text>

          <v-card-actions>
            <v-list-item class="grow">
              <v-list-item-content>
                <v-list-item-title>- {{quote.author}}</v-list-item-title>
              </v-list-item-content>

              <v-row align="center" justify="end">
                <v-btn text>
                  <v-icon class="mr-1">mdi-heart</v-icon>
                  <span class="subheading mr-2">SAVE</span>
                </v-btn>
              </v-row>
            </v-list-item>
          </v-card-actions>
        </v-card>
      </v-flex>
    </v-layout>

    <v-layout row justify="center" justify-space-between>
      <v-flex xs12>
        <div>
          <v-app>
            <v-sheet>
              <v-slide-group v-model="model" class="temp" center-active show-arrows>
                <v-slide-item
                  v-slot:default="{ active, toggle }"
                  v-for="(story, i) in stories.stories"
                  :key="i"
                >
                  <v-card max-width="200" @click="toggle" elevation="8" outlined class="mr-10">
                    <v-img height="200px" :src="require('@/assets/undraw_handcrafts_tree.svg')"></v-img>
                    <v-card-title
                      class="black--text align-end"
                      style="word-break: break-word;"
                    >{{story.title}}</v-card-title>
                    <v-card-subtitle class="pb-0">{{story.author}}</v-card-subtitle>

                    <v-card-actions>
                      <v-list-item class="grow">
                        <v-row align="center" justify="center">
                          <v-dialog v-model="dialog" width="600px">
                            <template v-slot:activator="{ on, attrs }">
                              <v-btn
                                color="#3DAF7B"
                                dark
                                v-bind="attrs"
                                v-on="on"
                                text
                                style="bottom: 0;"
                              >Read more</v-btn>
                            </template>
                            <v-toolbar dark color="#3DAF7B">
                              <v-btn icon dark @click="dialog = false">
                                <v-icon>mdi-close</v-icon>
                              </v-btn>
                              <v-toolbar-title>{{story.title}}</v-toolbar-title>
                              <v-spacer></v-spacer>
                            </v-toolbar>

                            <v-card>
                              <v-card-text>{{story.text}}</v-card-text>
                              <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn color="green darken-1" text @click="dialog = false">Close</v-btn>
                              </v-card-actions>
                            </v-card>
                          </v-dialog>
                        </v-row>
                      </v-list-item>
                    </v-card-actions>

                    <v-row class="fill-height" align="center" justify="center">
                      <v-scale-transition>
                        <v-icon
                          v-if="active"
                          color="white"
                          size="48"
                          v-text="'mdi-close-circle-outline'"
                        ></v-icon>
                      </v-scale-transition>
                    </v-row>
                  </v-card>
                </v-slide-item>
              </v-slide-group>
            </v-sheet>
          </v-app>
        </div>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<style>
.temp {
  background: #f3f3f3;
  padding: 10;
}
</style>


<script>
import QuotesService from "../../services/QuotesService";
import StoriesService from "../../services/StoriesService";

export default {
  name: "Inspiration",

  data: () => ({
    model: 0,
    dialog: false,
    quote: null,
    stories: null
  }),

  methods: {
    getQoutes: function() {
      let nOfQuotes = QuotesService.getNumberOfQuotes();
      let id = Math.floor(Math.random() * nOfQuotes);
      this.quote = QuotesService.get(id);
    },

    getStories: function() {
      this.stories = StoriesService.getAll();
    }
  },

  beforeMount() {
    this.getQoutes();
    this.getStories();
  }
};
</script>