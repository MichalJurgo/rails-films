class FilmsController < ApplicationController
  def index
    @q = Film.ransack(params[:q])
    @films = @q.result.includes(:genres).to_a.uniq
  end

  def show
  end
end
