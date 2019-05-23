<template>
  <div id="app">

	<nav class="navbar navbar-expand-lg navbar-light bg-dark mb-3">
	  <a class="navbar-brand text-white" href="#">BookShop</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>

	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	      	<router-link to="/" class="nav-link text-white">Home</router-link>
	      </li>
	      <li class="nav-item">
	      	<router-link to="/owner" class="nav-link text-white">Owner</router-link>
	      </li>
	    </ul>	    
	  </div>
	</nav>
	<transition name="slide" mode="out-in">
    	<router-view/>
    </transition>
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

<style lang="scss">
@import '~bootstrap/scss/bootstrap.scss';



/*slide transition*/
.slide-enter-active,.slide-leave-active {  
	transition: transform 0.4s ease-out;
}

.slide-enter {  
	transform: translateX(-30%);
}

.slide-leave-to {  
	transform: translateX(30%);
}

</style>
