# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @recent_news = NewsQuery.new.recent
  end
end
