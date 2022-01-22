/* 
*
* Author:       Sabina Gulcikova
*         xgulci00@stud.fit.vutbr.cz
* Date:            03/12/21 
*
*/

import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import VueRouter from 'vue-router'
import Routes from './router/router'
import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';
import 'firebase/compat/firestore';

Vue.config.productionTip = false

Vue.use(VueRouter);

firebase.initializeApp({
  apiKey: "AIzaSyDoJm1ldoyo8lrR19DRCiUAFcaStR_YZOw",
  authDomain: "wello-83193.firebaseapp.com",
  projectId: "wello-83193",
  storageBucket: "wello-83193.appspot.com",
  messagingSenderId: "813665035793",
  appId: "1:813665035793:web:9158b4b397b8f3136573b0",
  measurementId: "G-5M447F0DQ1"
});

export const db = firebase.firestore();

const router = new VueRouter({
  mode: 'history',
  routes: Routes
});

new Vue({
  vuetify,
  render: h => h(App),
  router: router
}).$mount('#app')
