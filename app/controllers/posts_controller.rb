# app/view/posts
class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @all_posts = @user.posts
  end

  def show
    @post = User.find_by(id: params[:user_id]).posts.find_by(id: params[:id])
    @user = User.find_by(id: @post.author.id)
  end
end
