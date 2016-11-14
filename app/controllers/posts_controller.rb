class PostsController < ApplicationController
  def index
      @posts = Post.order(updated_at: :desc)
    end

    def show
      @posts = Post.find_by(id: params[:id])
      # @comments = @post.comments
    end

    def new
    end

    def edit
      @article = Post.find_by(id: params[:id])
    end

    def create
      post = Post.new(posts_params)

      if post.save
        redirect_to posts_path
      else
        @errors = post.errors.full_messages
        render 'new'
      end
    end

    def update
      @posts = Post.find_by(id: params[:id])
      if @posts.update(post_params)
        redirect_to @posts
      else
        @errors = @posts.errors.full_messages
        render 'edit'
      end
    end

    def destroy
      post = Post.find_by(id: params[:id])
      @postss = Post.order(updated_at: :desc)
      if post.destroy
        redirect_to posts_path
      else
        @errors = ['delete unsuccessful']
        render 'index'
      end
    end

    private
      def post_params
        params.require(:post).permit(:title, :content)
      end
end
