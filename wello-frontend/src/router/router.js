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