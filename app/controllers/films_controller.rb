# frozen_string_literal: true

class FilmsController < ApplicationController
  def index
    @q = Film.ransack(params[:q])
    @films = FilmDecorator.decorate_collection(@q.result.includes(:genres).to_a.uniq)
  end

  def show
    @film = Film.find(params[:id]).decorate
    @library = Library.new
  end
end
