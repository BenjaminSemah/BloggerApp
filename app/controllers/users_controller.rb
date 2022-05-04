# frozen_string_literal: true

# app/view/users
class UsersController < ApplicationController
  def index
    render 'index'
  end

  def show
    render 'show'
  end
end
