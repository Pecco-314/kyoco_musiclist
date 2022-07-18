import Vue from 'vue'
import Router from 'vue-router'

import About from '@/components/About'
import MusicList from '@/components/MusicList'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      redirect: '/musiclist'
    },
    {
      path: '/musiclist',
      component: MusicList,
      name: 'musiclist',
      meta: {
        title: '元宵的歌单'
      }
    },
    {
      path: '/about',
      component: About,
      name: 'about',
      meta: {
        title: '关于元宵'
      }
    }
  ]
})
