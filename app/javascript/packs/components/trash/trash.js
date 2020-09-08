import axios from 'axios';
export default{
  name: 'trash',
  data(){
    return {
      posts: []
    }
  },
  created() {
    this.initialize();
  },
  methods: {
    initialize() {
      return axios
        .get("http://localhost:3000/api/posts/trash/all")
        .then(response => {
           this.posts = response.data.data;
         })
        .catch(e => {
           console.log(e);
        });
    },
    restorePost(item) {
      const index = this.posts.indexOf(item);
      axios
        .put(`http://localhost:3000/api/posts/restore/${item.id}`)
        .then(response => {
          this.initialize();
          this.$notify({
            title: 'Success',
            message: 'Post has been restored successfully',
            type: 'success'
          });
        })
        .catch(error => {
          console.log(error);
        });
    },
  }
}