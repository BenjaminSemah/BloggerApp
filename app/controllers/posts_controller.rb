# frozen_string_literal: true

# app/view/posts
class PostsController < ApplicationController
  def index
    render 'index'
  end

  def show
    render 'show'
  end
end
