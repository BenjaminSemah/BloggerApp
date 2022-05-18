# app/view/posts
class PostsController < ApplicationController
  before_action :current_user, only: [:create]

  def find_user
    @user = User.find(params[:user_id] || current_user.id)
  end


  def index
    @all_posts = find_user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user.id)

    @post = @user.posts.new(
      title: post_params[:title],
      text: post_params[:text],
      user_id: post_params[:user_id],
      comments_counter: 0,
      likes_counter: 0
    )

    if @post.save
      @post.update_posts_counter(params[:user_id])
      redirect_to user_path(current_user.id)
      flash[:notice] = 'You post was successfully created'
    else
      render :new, alert: 'An error has occurred while creating the post'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    if @post.destroy
      @post.update_posts_counter(@post.user_id)
      redirect_to users_path, status:303
      flash[:success] = 'Post has been deleted successfully'
    else
      redirect_to users_path, status:303
      flash.now[:error] = 'An error occured. Try again.'
    end
  end


  private

  def post_params
    params.require(:post).permit(:user_id, :title, :text)
  end
end
