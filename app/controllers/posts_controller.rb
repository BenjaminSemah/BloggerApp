# app/view/posts
class PostsController < ApplicationController
  before_action :current_user, only: [:create]

  def index
    @user = User.find_by(id: params[:user_id])
    @all_posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to user_path(current_user.id)
      flash[:notice] = 'Your post has been created successfully.'
    else
      render :new, alert: 'Error. Post was not created. Try again.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:author_id, :title, :text)
  end
end
