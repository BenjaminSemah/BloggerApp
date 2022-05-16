# app/view/users
class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
