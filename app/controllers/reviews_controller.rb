# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @film = Film.find(params[:film_id])
    @reviews = @film.reviews
  end

  def show
    film = Film.find(params[:film_id])
    @review = film.reviews.find(params[:id])
  end

  def new
    @film = Film.find(params[:film_id])
    @review = @film.reviews.build
  end

  def create
    create_review = ReviewCreator.new(review: review_params, film_id: params[:film_id],
      user_id: current_user.id).call
    if create_review
      redirect_to film_path(params[:film_id])
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :user_id, :film_id)
  end
end
