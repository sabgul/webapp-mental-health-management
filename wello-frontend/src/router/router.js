// import Vue from 'vue';
// import VueRouter from 'vue-router';

// Vue.use(VueRouter);

// const router = new VueRouter({
//     mode: 'history',

//     routes: [
//         // General routes
//         {
//             path: '/',
//             name: 'homepage',
//             component: () => import('@/views/general/MainPage'),
//         },

//         {
//             path: '/inspiration',
//             name: 'inspiration',
//             component: () => import('@/views/explore/Inspiration'),
//         }, 

//         {
//             path: '/trends',
//             name: 'trends',
//             component: () => import('@/views/general/Trends'),
//         }, 

//         {
//             path: '/safespace',
//             name: 'safespace',
//             component: () => import('@/views/general/SafeSpace'),
//         },
//     ]
// });
 
export default[
    {
        path: '/',
        name: 'homepage',
        component: () => import('@/views/general/MainPage'),
    },
    {
        path: '/inspiration',
        name: 'inspiration',
        component: () => import('@/views/explore/Inspiration'),
    }, 

    {
        path: '/trends',
        name: 'trends',
        component: () => import('@/views/general/Trends'),
    }, 

    {
        path: '/safespace',
        name: 'safespace',
        component: () => import('@/views/general/SafeSpace'),
    },
]