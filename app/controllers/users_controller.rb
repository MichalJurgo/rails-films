# frozen_string_literal: true

class UsersController < ApplicationController
  access all: [:show], user: :all

  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
  end
end
