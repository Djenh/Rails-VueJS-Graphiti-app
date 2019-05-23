<template>
  	<div class="container">
    	<div class="row">
        <div class="col-6">
          <Author/>
        </div>

        <div class="col-6">
          <Book />
        </div> 
      </div>
  	</div>
</template>

<script>
import Author from "./Author.vue"
import Book from "./Book.vue"
import Library from "./Library.vue"
import University from "./University.vue"

  export default {
  	name: 'Home',
    components: {
      Author,
      Book,
      Library,
      University,
    },
    data: function () {
      return {
        
      }
    }
  };
</script>

<style>
	
</style>