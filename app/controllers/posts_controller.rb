class PostsController < ApplicationController

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
    @post = Post.find(params[:id])
    @post.like += 1
    @post.save
    redirect_to posts_path
  end

  def dislike
    @post = Post.find(params[:id])
    @post.like -= 1
    @post.save
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
