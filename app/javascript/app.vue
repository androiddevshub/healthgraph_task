<template>
  <div id="app">
    <div>
      <b-navbar toggleable="lg" variant="info">
        <router-link class="nav-link" to="/"><b-navbar-brand href="">Home</b-navbar-brand>
        </router-link>
        
        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          
          <!-- Right aligned nav items -->
          <b-navbar-nav class="ml-auto">
             <b-nav-form>
              <router-link class="nav-link" to="/trash">Trash</router-link>
              <!-- <b-button size="sm" class="my-2 my-sm-0" type="submit">Trash</b-button> -->
            </b-nav-form>
            
          </b-navbar-nav>
        </b-collapse>
      </b-navbar>
    </div>
    <div>
      <router-view/>
      <!-- <post></post> -->
    </div>
  </div>
</template>

<script>
import post from './packs/components/post/post.vue'
export default {
  components: {
    post: post
  },
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
  
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
