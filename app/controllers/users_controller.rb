# rubocop:disable Style/FrozenStringLiteralComment
# app/view/users
class UsersController < ApplicationController
  def index
    render 'index'
  end

  def show
    render 'show'
  end
end
# rubocop:enable Style/FrozenStringLiteralComment
