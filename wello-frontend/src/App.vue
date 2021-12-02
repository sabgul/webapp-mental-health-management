<template>
  <v-app>
    <v-main>
      <SideBar/>

      <v-app-bar app>
      Title
      </v-app-bar>

      <router-view :key="$route.fullPath"/>
    </v-main>
  </v-app>
</template>

<script>
import SideBar from './components/SideBar';

export default {
  name: 'App',

  components: {
    SideBar,
  },

  data: () => ({
    //
  }),
};
</script>
