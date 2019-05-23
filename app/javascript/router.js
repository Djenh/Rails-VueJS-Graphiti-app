import Vue from 'vue'
import Router from 'vue-router'
import Home from 'components/Home'
import Owner from 'components/Owner'

Vue.use(Router)

export default new Router({
  
  mode: "history",
  base: process.env.BASE_URL,
  
  routes: [
    {
      	path: '/',
      	name: 'home',
      	component: Home      
    },  
    {
    	path: '/owner',
    	name: 'owner',
    	component: Owner
    }  
  ]
})