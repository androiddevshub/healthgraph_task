class Posts < Api
  format :json
  default_format :json

  namespace :posts, desc: 'Posts related CRUD operations' do

    post '/' do
      post = Post.new(description: params[:description])
      if post.save
        { 
          status: true,
          message: 'New post created successfully.',
          data: post
        }
      else
        error!({ status: false, message: post.errors.full_messages.join(',') }, 400)
      end
    end

    get '/' do
      post = Post.all
      if post
        { 
          status: true,
          data: post
        }
      else
        error!({ status: false, message: post.errors.full_messages.join(',') }, 400)
      end
    end


  end
end
