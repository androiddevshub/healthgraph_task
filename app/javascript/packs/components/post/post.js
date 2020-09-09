import axios from 'axios';
export default{
  name: 'post',
  data() {
    return {
      posts: [],
      newComment: '',
      dialogFormVisible: false,
      form: {
        description: '',
      },
      comment: {
        description: ''
      },
      baseUrl: window.location.href
    }
  },
  created() {
    this.initialize();
    console.log(this.baseUrl)
  },
  methods: {
    initialize() {
      return axios
        .get(`${this.baseUrl}api/posts`)
        .then(response => {
           this.posts = response.data.data;
         })
        .catch(e => {
           console.log(e);
        });
    },
    createPost() {
      return axios
        .post(`${this.baseUrl}api/posts`,
          {
            description: this.form.description
          }
        )
        .then(response => {
           this.dialogFormVisible = false;
           this.form.description = '';
           this.initialize();
           this.$notify({
            title: 'Success',
            message: 'New post has been added successfully',
            type: 'success'
          });
         })
        .catch(e => {
           console.log(e);
        });
    },
    hardDeletePost(item) {
      const index = this.posts.indexOf(item);
      const result = confirm("Are you sure you want to delete this post?"); 
      if (result){
        axios
          .delete(`${this.baseUrl}api/posts/hard_delete/${item.id}`)
          .then(response => {
            this.initialize();
            this.$notify({
              title: 'Success',
              message: 'Post has been deleted successfully',
              type: 'success'
            });
          })
          .catch(error => {
            console.log(error);
          });
      }
   
    },
    softDeletePost(item) {
      const index = this.posts.indexOf(item);
      axios
        .put(`${this.baseUrl}api/posts/soft_delete/${item.id}`)
        .then(response => {
          this.initialize();
          this.$notify.info({
            title: 'Info',
            message: 'Post has been archived, it can be restored'
          });
        })
        .catch(error => {
          console.log(error);
        });
    },
    addComment(post_id, comments){
      // console.log(this.comment)
      console.log(this.$refs['commentBox'])
      this.$refs['commentBox'].forEach((item, index) => {
        if(item.$el[0].value !== ''){
          return axios
            .post(`${this.baseUrl}api/comments`,
              {
                post_id: post_id,
                description: item.$el[0].value
              }
            )
            .then(response => {
              this.dialogFormVisible = false;
              comments.push(response.data.data);
              item.$el[0].value = '';
            })
            .catch(e => {
              console.log(e);
            });
        }
      })
    },
    deleteComment(item, post){
      const index = post.indexOf(item);
      axios
        .delete(`${this.baseUrl}/api/comments/${item.id}`)
        .then(response => {
        })
        .catch(error => {
          console.log(error);
        });
        post.splice(index, 1);
    }
  }
}