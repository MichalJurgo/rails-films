# frozen_string_literal: true

class LibrariesController < ApplicationController
  def create
    @library = Library.new(library_params)
    if @library.save
      redirect_to @library.film
    else
      render 'new'
    end
  end

  def update
    @library = Library.find(params[:id])
    if @library.update_attributes(library_params)
      redirect_to @library.film
    else
      render 'new'
    end
  end

  def destroy
    @library = Library.find(params[:id])
    film = @library.film
    @library.destroy
    redirect_to film
  end

  private

  def library_params
    params.require(:library).permit(:status_id, :user_id, :film_id)
  end
end
