class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @posts = Post.all
    
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  
  end

  def new 
    @post = Post.new
  end

  def edit
   
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end