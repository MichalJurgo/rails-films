# frozen_string_literal: true

class NewsController < ApplicationController
  access all: %i[show index], %i[admin editor] => :all

  def index
    @news = News.order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @news = News.includes(:comments).find(params[:id])
    @comment = Comment.new
  end

  def new
    @news = News.new
  end

  def create
    @news = current_user.news.new(news_params)
    puts '=' * 80
    puts @news.inspect
    if @news.save
      redirect_to @news
    else
      render 'new'
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes(news_params)
      redirect_to @news
    else
      render 'edit'
    end
  end

  private

  def news_params
    params.require(:news).permit(:heading, :body, :user_id, :film_id)
  end
end
