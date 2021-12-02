<template>
<v-container>
    
    
    <!-- expand-on-hover -->
    <v-navigation-drawer
        color="#F3F3F3"
        permanent
        app
    >
    <v-container>
      Wello. <br>
      of {signed user}
    </v-container>

        <v-divider></v-divider>

        <!-- Menu  -->
        
        <!-- Explore group -->
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
            v-for="([title, icon, link], i) in explore_list"
            :key="i"
            link @click="goToPage(link)"
          >
          
            <v-list-item-icon>
              <v-icon v-text="icon"></v-icon>
            </v-list-item-icon>
            <v-list-item-title v-text="title"></v-list-item-title>
          </v-list-item>
        </v-list-group>

        <!-- Exercise group -->
        <v-list-group
          no-action
        >
          <template v-slot:activator>
            <v-list-item-content>
              <v-list-item-title>Exercise</v-list-item-title>
            </v-list-item-content>
          </template>

          <v-list-item
            v-for="([title, icon, link], i) in exercise_list"
            :key="i"
            link @click="goToPage(link)"
          >
            <v-list-item-icon>
              <v-icon v-text="icon"></v-icon>
            </v-list-item-icon>
          
            <v-list-item-title v-text="title"></v-list-item-title>
          
          </v-list-item>
        </v-list-group> 

        <!-- Examine group -->
        <v-list-group
          no-action
        >
          <template v-slot:activator>
            <v-list-item-content>
              <v-list-item-title>Examine</v-list-item-title>
            </v-list-item-content>
          </template>

          <v-list-item
            v-for="([title, icon, link], i) in examine_list"
            :key="i"
            link @click="goToPage(link)"
          >
            <v-list-item-icon>
              <v-icon v-text="icon"></v-icon>
            </v-list-item-icon>
          
            <v-list-item-title v-text="title"></v-list-item-title>
          
          </v-list-item>
        </v-list-group> 

        </v-list>
    </v-navigation-drawer>
  </v-container>
</template>

<script>
  export default {
    name: 'SideBar',

    data: () => ({ 
      explore_list: [
        ['Dashboard', 'mdi-circle-small', '/'],
        ['Get inspired', 'mdi-circle-small', '/inspiration'],
      ], 

      exercise_list: [
        ['Breathe', 'mdi-minus', '/breathing'],
        ['Journal', 'mdi-minus', '/journaling'],
        ['Meditate', 'mdi-minus', '/meditation'],
        ['Reflect', 'mdi-minus', '/reflect'],
      ], 

      examine_list: [
        ['Trends', 'mdi-menu-right-outline', '/trends'],
        ['Safe space', 'mdi-menu-right-outline', '/safespace'],
      ],
    }),

    methods: {
        goToPage(link) {
          this.$router.push({ path: link });
        }
    },
  }
</script>
