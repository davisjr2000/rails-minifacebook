class PostsController < ApplicationController
  before_action :set_post, only: [:like, :dislike]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def like
    @post.like += 1
    @post.save
  end

  def dislike
    @post.like -= 1
    @post.save
    redirect_to posts_path
  end

  private

  def set_post
     @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
