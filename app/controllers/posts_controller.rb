class PostsController < ApplicationController
  # before_action :set_post, only: [:show, :edit, :updated, :index]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post  =Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = find_post
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:id])
  end

  def edit
    @post = find_post
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = find_post
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    Post.find(params[:id])
  end

end
