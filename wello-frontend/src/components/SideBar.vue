<template>
  <v-container>
<div id="app">
  <v-app id="inspire">
    <v-app-bar app>
      Title
    </v-app-bar>
    
    <!-- expand-on-hover -->
    <v-navigation-drawer
        color="#e9e9e9"
        permanent
        app
    >
    <v-container>
      Wello. <br>
      of {signed user}
    </v-container>

        <v-divider>
  
        </v-divider>


        <v-list nav dense>
          <v-list-group
          :value="true"
          no-action
        >
          <template v-slot:activator>
            <v-list-item-content>
              <v-list-item-title>Explore</v-list-item-title>
            </v-list-item-content>
          </template>

          <v-list-item
            v-for="([title, icon], i) in explore_list"
            :key="i"
            link
          >
            <v-list-item-icon>
              <v-icon v-text="icon"></v-icon>
            </v-list-item-icon>
            <v-list-item-title v-text="title"></v-list-item-title>
          </v-list-item>
        </v-list-group>

        <v-list-group
          no-action
        >
          <template v-slot:activator>
            <v-list-item-content>
              <v-list-item-title>Exercise</v-list-item-title>
            </v-list-item-content>
          </template>

          <v-list-item
            v-for="([title, icon], i) in exercise_list"
            :key="i"
            link
          >
            <v-list-item-icon>
              <v-icon v-text="icon"></v-icon>
            </v-list-item-icon>
          
            <v-list-item-title v-text="title"></v-list-item-title>
          
          </v-list-item>
        </v-list-group>

        <v-list-item link href="#">
                <v-list-item-icon>
                    <v-icon color="#0C722E" small>mdi-lightbulb</v-icon>
                </v-list-item-icon>
                <v-list-item-title class="title">Trends.</v-list-item-title> 
        </v-list-item>

        <v-list-item link href="#">
                <v-list-item-icon>
                    <v-icon color="#0C722E" small>mdi-lightbulb</v-icon>
                </v-list-item-icon>
                <v-list-item-title class="title">Safe space.</v-list-item-title> 
        </v-list-item>
        </v-list>
    </v-navigation-drawer>
  </v-app>
</div>
  </v-container>
</template>

<script>
  export default {
    name: 'SideBar',

    data: () => ({ 
      explore_list: [
        ['Dashboard', 'mdi-account-multiple-outline'],
        ['Get inspired', 'mdi-lightbulb-on-outline' ],
      ], 

      exercise_list: [
        ['Breathe', 'mdi-account-multiple-outline'],
        ['Journal', 'mdi-cog-outline'],
        ['Meditate', 'mdi-meditation'],
        ['Reflect', 'mdi-cog-outline'],
      ],
    }),
  }
</script>
