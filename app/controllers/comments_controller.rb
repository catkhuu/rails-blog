class CommentsController < ApplicationController
  def index
    @post = Post.find_by(id: params[:post_id])
    @comments = @post.comments
    render 'posts/show'
  end
  def create
    @post = Post.find_by(id: params[:post_id])
    comment = @post.comments.new(comment_params)
    if comment.save
      redirect_to post_comments_path(@post) # redirect to this vs. post_path(@post), because latter only displays article minus comments. Even if post has comments, it will say the article doesn't unless posts/:id/comments path
    else
      @errors = comment.errors.full_messages
      render 'articles/show' # render posts/show vs. show because comments lives on posts#show
    end
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @comment = @post.comments.find_by(id: params[:id])
    if @comment.destroy
      redirect_to post_comments_path(@post)
    else
      @errors = ['unsuccessful delete']
      render 'posts/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
