class UsersController < ApplicationController
  access all: [:show], user: :all

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
