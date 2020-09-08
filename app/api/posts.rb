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

    get '/trash/all' do
      posts = Post.all.where(disabled: true)
      obj = []
      if posts
        posts.each do |post|
          obj << { 
            id: post.id,
            description: post.description,
            comments: post.comments
          }
        end
        { 
          status: true,
          data: obj
        }
      else
        error!({ status: false, message: posts.errors.full_messages.join(',') }, 400)
      end
    end

    get '/' do
      posts = Post.all.where(disabled: false)
      obj = []
      if posts
        posts.each do |post|
          obj << { 
            id: post.id,
            description: post.description,
            comments: post.comments
          }
        end
        { 
          status: true,
          data: obj
        }
      else
        error!({ status: false, message: posts.errors.full_messages.join(',') }, 400)
      end
    end

    put '/:id' do
      post = Post.find(params[:id])
      if post && post.update(description: params[:description])
        { 
          status: true,
          message: 'Post update successfully',
          data: post
        }
      else
        error!({ status: false, message: post.errors.full_messages.join(',') }, 400)
      end
    end

    delete '/hard_delete/:id' do
      post = Post.find(params[:id])
      if post && post.destroy
        { 
          status: true,
          message: 'Post hard deleted'
        }
      else
        error!({ status: false, message: post.errors.full_messages.join(',') }, 400)
      end
    end

    put '/soft_delete/:id' do
      post = Post.find(params[:id])
      if post && post.update(disabled: true)
        { 
          status: true,
          message: 'Post soft deleted'
        }
      else
        error!({ status: false, message: post.errors.full_messages.join(',') }, 400)
      end
    end

    put '/restore/:id' do
      post = Post.find(params[:id])
      if post && post.update(disabled: false)
        { 
          status: true,
          message: 'Post restored'
        }
      else
        error!({ status: false, message: post.errors.full_messages.join(',') }, 400)
      end
    end


  end
end
