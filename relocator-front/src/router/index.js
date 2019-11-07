import Vue from 'vue'
import Router from 'vue-router'
import Signin from '@/components/Signin.vue'
import Signup from '@/components/Signup.vue'
import Records from '@/components/records/Records.vue'
import Artists from '@/components/artists/Artists.vue'
import Jobs from '@/components/jobs/Jobs.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/artists',
      name: 'Artists',
      component: Artists
    },
    {
      path: '/records',
      name: 'Records',
      component: Records
    },
    {
      path: '/',
      name: 'Jobs',
      component: Jobs
    },
    {
      path: '/signin',
      name: 'Signin',
      component: Signin
    },
    {
      path: '/signup',
      name: 'Signup',
      component: Signup
    }
  ]
})
