<template>
  <div id="app">
    <div>
      <b-navbar toggleable="lg" variant="info">
        <b-navbar-brand href="#">Homes</b-navbar-brand>

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          
          <!-- Right aligned nav items -->
          <b-navbar-nav class="ml-auto">
             <b-nav-form>
              <b-button size="sm" class="my-2 my-sm-0" type="submit">New Post</b-button>
              <b-button size="sm" class="my-2 my-sm-0" type="submit">Trash</b-button>
            </b-nav-form>
            
          </b-navbar-nav>
        </b-collapse>
      </b-navbar>
    </div>
  </div>
</template>

<script>
export default {
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
