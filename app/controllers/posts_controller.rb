# rubocop:disable Style/FrozenStringLiteralComment
# app/view/posts
class PostsController < ApplicationController
  def index
    render 'index'
  end

  def show
    render 'show'
  end
end
# rubocop:enable Style/FrozenStringLiteralComment
