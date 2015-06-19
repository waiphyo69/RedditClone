class PostsController < ApplicationController
  before_action :require_postauthor, only: :edit
  def new
    @post = current_user.posts.new
    @sub = Sub.find(params[:sub_id])
  end

  def create
    @post = current_user.posts.new(post_params)
    @sub = Sub.find(params[:sub_ids])
    @post.sub_id = @sub.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      redirect_to sub_url(@sub)
    end
  end

  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end


  def show
    @post = Post.find(params[:id])
  end


  private
  def post_params
    params.require(:post).permit(:title,:url,:content,:author_id,:sub_ids)
  end
end
