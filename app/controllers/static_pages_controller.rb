# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @recent_news = News.last(6).reverse
  end
end
