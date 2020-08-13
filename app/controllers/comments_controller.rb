class CommentsController < ApplicationController
  before_action :authenticate_user!
  include Devise::Controllers::Helpers
  def index
    @comments = Comment.all.order("created_at DESC")
  end

  def new
    @comment = Comment.new
  end

  def create
    @user = current_user if user_signed_in?
    @post = Post.find(params[:id])
    @comment = Comment.new(user_id: @user.id, post_id: params[:id], content: params[:comment][:content])

    if @comment.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(post_params)
      redirect_to @comment
    else
      render 'edit'
    end
  end
end
