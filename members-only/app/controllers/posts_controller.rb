class PostsController < ApplicationController
  before_filter :authorize, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "You've created a new post."
      redirect_to posts_path
    else
      flash.now[:alert] = "Something went wrong!"
      render :new
    end
  end

  private

    def post_params
      params.require(:post).permit(:body)
    end
end
