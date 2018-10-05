# frozen_string_literal: true

class PeopleController < ApplicationController
  def show
    @person = Person.find(params[:id])
  end
end
