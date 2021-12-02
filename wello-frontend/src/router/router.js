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
        path: '/breathing',
        name: 'breathe',
        component: () => import('@/views/exercise/Breathing'),
    },

    {  
        path: '/journaling',
        name: 'journal',
        component: () => import('@/views/exercise/Journal'),
    }, 

    {  
        path: '/meditation',
        name: 'meditate',
        component: () => import('@/views/exercise/Meditate'),
    },

    {  
        path: '/reflect',
        name: 'reflect',
        component: () => import('@/views/exercise/Reflect'),
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