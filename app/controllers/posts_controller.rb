# app/view/posts
class PostsController < ApplicationController
  before_action :current_user, only: [:create]

  def index
    @user = User.find_by(id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(
      title: post_params[:title],
      text: post_params[:text],
      author_id: post_params[:user_id],
      comments_counter: 0,
      likes_counter: 0
    )

    if @post.save
      redirect_to user_path(current_user.id)
      flash[:notice] = 'You post was successfully created'
    else
      render :new, alert: 'An error has occurred while creating the post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:author_id, :title, :text)
  end
end
