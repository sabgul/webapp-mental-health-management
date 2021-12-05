<template>
  <v-app>
    <v-main>
      <SideBar/>

      <v-app-bar height="72px" app class="navbar">
      {{currentRouteName}}
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
    'SideBar': SideBar,
  },

  computed: {
    currentRouteName() {
        let name = this.$route.name;

        if(name !== null)
          name = name.charAt(0).toUpperCase() + name.slice(1);

        return name;
    }
  },

  data: () => ({
    //
  }),
};
</script>

<style> 

#app {
  background-color: #F3F3F3;
  font-family: 'Courier New', Courier, monospace;
}

.unscrollable {margin: 0; height: 100%; overflow: hidden};

#navbar {
  color: #3daf7b;
}
</style>