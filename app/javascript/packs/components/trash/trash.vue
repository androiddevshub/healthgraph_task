<template>
  <div class='post-all'>
    <el-container>
      <el-main>
         <div v-for="post in posts" :key="post.id" class="text item">
            <el-card shadow="always" class="box-card">
              <div>
                <el-row>
                  <el-col :span="22">
                    <span><h6>{{post.description}}</h6></span>
                  </el-col>
                  <el-col :span="2">
                    <i class="el-icon-refresh" @click="restorePost(post)" style="float: right; padding: 3px 0"></i>
                  </el-col>
                </el-row>
              </div>
              <hr>
              <div v-for="comment in post.comments" :key="comment.id" >
                <div class="comment-text">
                  <span class="comment-text-description">
                    {{comment.description }} 
                  </span>
                </div>
              </div>
            </el-card>
        </div>
         <div v-if="posts.length == 0">
            <span style="align:center">No post archived</span>
          </div>
      </el-main>
    </el-container>
  </div>
</template>

<script src="./trash.js"></script>
<style src="./trash.css" scoped></style>