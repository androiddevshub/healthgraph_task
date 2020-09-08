<template>
  <div class='post-all'>
    <el-container>
      <el-header class="btn-new-post-container"> <el-button class="btn-new-post" type="primary" @click="dialogFormVisible = true">New post</el-button></el-header>
      <el-main>
         <div v-for="post in posts" :key="post.id" class="text item">
            <el-card shadow="always" class="box-card">
              <div>
                <el-row>
                  <el-col :span="20">
                    <span><h6>{{post.description}}</h6></span>
                  </el-col>
                  <el-col :span="4">
                    <el-row>
                      <el-col :span="12">
                        <b-icon icon="x-circle" scale="3" variant="danger" @click="softDeletePost(post)" style="float: right; padding: 3px 0"></b-icon>
                      </el-col>
                      <el-col :span="12">
                        <b-icon icon="trash-fill" scale="3" variant="danger" @click="hardDeletePost(post)" style="float: right; padding: 3px 0"></b-icon>
                      </el-col>
                    </el-row>
                  </el-col>
                </el-row>
              </div>
              <hr>
              <div v-for="comment in post.comments" :key="comment.id" >
                <div class="comment-text">
                  <span class="comment-text-description">
                    {{comment.description }} 
                  </span>
                  <span class="comment-delete">
                    <b-icon icon="trash-fill" scale="1" @click="deleteComment(comment, post.comments)" style="float: right;" variant="info"></b-icon>
                  </span>
                </div>
              </div>
              <div class="comment-input-box">
                 <el-row>
                  <el-col :span="20">
                     <el-form 
                      class="comment-input"
                      :id="post.id"
                      ref="commentBox"
                      :model="comment">
                        <el-form-item>
                          <textarea
                            class="comment-box"
                            type="textarea"
                            :rows="1"
                            placeholder="Leave a comment"
                          />
                        </el-form-item>
                      </el-form>
                  </el-col>
                  <el-col :span="4">
                    <div class="comment-send">
                      <el-button 
                        @click="addComment(post.id, post.comments)" 
                        type="info" 
                        
                        icon="el-icon-s-promotion" 
                        circle></el-button>
                    </div>
                  </el-col>
                </el-row>
               
               
              </div>
            </el-card>
        </div>
      </el-main>
    </el-container>
    <el-dialog title="New Post" :visible.sync="dialogFormVisible">
      <el-form :model="form">
        <el-form-item label="Description">
          <el-input
            type="textarea"
            :rows="5"
            placeholder="Please input"
            v-model="form.description">
          </el-input>
          
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">Cancel</el-button>
        <el-button type="primary" @click="createPost()">Submit</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script src="./post.js"></script>
<style src="./post.css" scoped></style>