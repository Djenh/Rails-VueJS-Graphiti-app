# README


* Ruby version
ruby '2.5.3'
rails '5.2.3'
vuejs '2.6.10'


* Configuration
bundle install
yarn install


* Deployment instructions


1- Create project with : *rails new Bookshop* After, launch *cd Bookshop* in terminal

2- Add required gem in Gemfile file: 
	# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
	gem 'webpacker'

	# Graphiti for using Rails & GraphQL
	gem 'graphiti'

	# Rails responder gemfile
	gem 'responders'

	# For automatic ActiveRecord pagination
	gem 'kaminari'

	# PostgreSQL database gem
	gem 'pg'

3- Launch *bundle install* in terminal

4- After installing gems, execute three following commands
	rails webpacker:install
	rails webpacker:install:vue
	yarn install

5- Add following in config/initializers/content_security_policy.rb file
	Rails.application.config.content_security_policy do |policy|
	  if Rails.env.development?
		policy.script_src :self, :https, :unsafe_eval
		policy.connect_src :self, :https, 'http://localhost:3035', 'ws://localhost:3035'
	  else
		policy.script_src :self, :https
	  end
	end

6- To enable webpacker in your rails app, go to app/views/layout/application.html.erb file and replace:
	   	<%= stylesheet_link_tag    'application', media: 'all' %>
	    <%= javascript_include_tag 'application' %>
	with:
	    <%= stylesheet_pack_tag 'application', media: 'all' %>
	    <%= javascript_pack_tag 'application' %>

7- Initialize a webpack in VueJS side by going to app/javascript/packs/applications.js file and write following configuration : 
	import Vue from 'vue'
	import App from '../App.vue'
	import router from '../router'

	Vue.config.productionTip = false

	document.addEventListener('DOMContentLoaded', () => {
	  const el = document.body.appendChild(document.createElement('app'))
	  const app = new Vue({
	    router,
	    el,
	    render: h => h(App)
	  })

	  console.log(app)
	})

8- In app/javascript/packs/hello_vue.js file, put all code in comment

9- In App.vue file, put this content
	<template>
	  <div id="app">
	    <router-view/>
	  </div>
	</template>

	<script>
	  export default {
	    data: function () {
	      return {
	        
	      }
	    }
	  };
	</script>
	<style></style>


10- Execute *yarn add vue-router*. Then in app/javascript/ folder create a file named *router.js* Then write following code in it :
	import Vue from 'vue'
	import Router from 'vue-router'
	import Home from 'components/Home'

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
	  ]
	})

11- Create a folder named "components" and create in it a Home.vue file. Write a sample vue component code in that file. Below is an example
	<template>
	  <div >
	    <p> Welcome in VueJS Home component </p>
	  </div>
	</template>

	<script>
	  export default {
	  	name: 'Home',
	    data: function () {
	      return {
	        
	      }
	    }
	  };
	</script>
	<style></style>

12- Launch in your terminal *rails g controller Main index*

13- Update Rails routes, in config/routes.rb write 
	root 'main#index'

14- Launch your app by opening two terminals
	Execute ruby bin\webpack-dev-server  in first terminal
	Execute *rails s* in the second one
	Then go to url localhost:3000/ in your browser to see your app interface.

15- Everything must be ok at this step. If right, then configure your database environment in config/database.yml file.
	default: &default
	  adapter: postgresql
	  pool: 5
	  encoding: unicode
	  host: localhost
	  port: 5432
	  username: root
	  password: accesrootbd

	development:
	  <<: *default
	  database: bookshop

16- Install Bootstrap and VueX by executing this command
	yarn add bootstrap vuex

17- To configure VueX in our app, first create a file named "store.js" in app/javascript.
Then write following code in it.
	import Vue from "vue";
	import Vuex from "vuex";

	Vue.use(Vuex);

	export default new Vuex.Store({
	  state: {

	  },

	  getters: {
	    
	  },

	  mutations: {
	  	
	  },

	  actions: {
	  	
	  }
	});

18- Import store in your main application file. So in app/javascript/packs/application.js add *import store from '../store'* and in Vue instance, under *router*, add *store*.

19- Create Rails models. Define model's relationship

20- Create Graphiti resources
	rails generate graphiti:resource Author full_name:string email:string

	Check Graphiti offical documentation to know how to define your models *https://www.graphiti.dev*

21- Update Graphiti resources with its relationships.
	Check Graphiti offical documentation to know how to define your relationships *https://www.graphiti.dev*

22- Add Spraypaint to app. Execute *yarn add spraypaint isomorphic-fetch*

23- Add boostrap to App.vue component style part
	<style lang="scss">
	@import '~bootstrap/scss/bootstrap.scss';
	</style>

24- Initialize Spraypaint in our app. Create a new file named *model.js* in app/javascript/ folder. Put following content in it.
	const {
	  SpraypaintBase,
	  attr,
	  belongsTo,
	  hasMany,
	  hasOne  
	} = require("spraypaint/dist/spraypaint")

	export const ApplicationRecord = SpraypaintBase.extend({
	  static: {
	    baseUrl: "/",
	    apiNamespace: "api/v1"
	  }
	})

25- Add models to Spraypaint
	export const Author = ApplicationRecord.extend({
	  static: {
	    jsonapiType: "authors"
	  },

	  attrs: {
	    fullName: attr(),
	    email: attr(),
	    createdAt: attr({ persist: false }),
	  	updatedAt: attr({ persist: false }),

	  	books: hasMany()
	  }
	})

26- Create Vue components

27- Create bind value and methods

