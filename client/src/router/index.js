import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '@/store'
import Home from '@/views/Home.vue'
import EventsList from '@/views/EventsList.vue'
import EventsListDetails from '@/views/EventsListDetails.vue'
import Login from '@/views/Login.vue'
import TwoFactorAuth from '@/views/TwoFactorAuth.vue'
import QrCode from '@/views/QrCode.vue'
import UsersList from '@/views/UsersList.vue'
import Dashboard from '@/views/Dashboard.vue'
import DynamicDashboard from '@/views/DynamicDashboard.vue'
import Audit from '@/views/Audit.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    component: Home,
    children: [
      {
        path: '',
        name: 'home',
        component: EventsList,
        meta: {
          requiresAuth: true
        },
      },
      {
        path: '/events/:requestid',
        name: 'eventsDetails',
        components: { default: EventsList },
        props: true,
        meta: {
          requiresAuth: true
        },
      },
      {
        path: '/event-details/:requestid',
        name: 'eventsDetails1',
        components: { default: EventsListDetails },
        props: true,
        meta: {
          requiresAuth: true
        },
      },

      {
        path: '/dashboard',
        name: 'dashboard',
        component: Dashboard,
        meta: {
          requiresAuth: true
        },
      },
      {
        path: '/dynamic-dashboard',
        name: 'dynamicDashboard',
        component: DynamicDashboard,
        meta: {
          requiresAuth: true
        },
      },
      {
        path: '/users',
        name: 'usersList',
        component: UsersList,
        meta: {
          requiresAuth: true
        },
      },
      {
        path: '/audit',
        name: 'audit',
        component: Audit,
        meta: {
          requiresAuth: true
        },
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: Login
  },
  {
    path: '/tfa',
    name: 'tfa',
    component: TwoFactorAuth
  },
  {
    path: '/register',
    name: 'register',
    component: QrCode
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {
    if (store.getters.isLoggedIn) {
      next()
      return
    }
    next('/login')
  } else {
    next()
  }
})

export default router
