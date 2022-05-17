class CommentsController < ApplicationController
  before_action :current_user, only: [:create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(current_user.id, Post.find(params[:post_id]))
      flash[:notice] = 'You comment has been added successfully.'
    else
      render :new, alert: 'Error! Comment was not added. Try again.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :text)
  end
end
