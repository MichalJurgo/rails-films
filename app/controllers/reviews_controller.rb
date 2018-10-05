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
    film = Film.find(params[:film_id])
    @review = film.reviews.create(review_params)
    @review.user = current_user
    if @review.save
      redirect_to film
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :user_id, :film_id)
  end
end
