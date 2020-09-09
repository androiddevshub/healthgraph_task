class Comments < Grape::API
  format :json
  default_format :json

  namespace :comments, desc: 'Comments related CRUD operations' do
    
    # get '/' do 
    #   { 

    #   }
    # end


    post '/' do
      post = Post.find(params[:post_id])
      comment = post.comments.new(description: params[:description])
      if comment.save
        { 
          status: true,
          message: 'Comment added successfully',
          data: comment
        }
      else
        error!({ status: false, message: post.errors.full_messages.join(',') }, 400)
      end
    end

    delete '/:id' do
      comment = Comment.find(params[:id])
      if comment && comment.destroy
        { 
          status: true,
          message: 'Comment deleted'
        }
      else
        error!({ status: false, message: post.errors.full_messages.join(',') }, 400)
      end
    end


  end
end