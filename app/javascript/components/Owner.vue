<template>
  <div class="container">
    <div class="row">
      <div class="col-md-6">
       <Library/> 
      </div>

      <div class="col-md-6">
        <University/>
      </div>
    </div>
  </div>  	
</template>

<script>
import Library from "./Library.vue"
import University from "./University.vue"

  export default {
  	name: 'Owner',
    components: {
      Library,
      University
    },
    data: function () {
      return {
        
      }
    }
  };
</script>

<style>
	
</style>