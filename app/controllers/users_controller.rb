# app/view/users
class UsersController < ApplicationController
  def index
    @all_users = User.all
  end

  def show
    render 'show'
  end
end
