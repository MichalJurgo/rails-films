class NewsController < ApplicationController
  def index
    @news = News.all.page(params[:page]).per(6)
  end

  def show
    @news = News.find(params[:id])
  end
end
