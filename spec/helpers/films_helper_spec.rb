# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FilmsHelper, type: :helper do
  let!(:film) { create(:film) }
  let!(:genres) { create_list(:genre, 2) }
  describe "list_production" do
    it "lists production countries for given movie" do
      expect(list_production(film)).to include(film.production.first)
    end
  end

  describe "list_genres" do
    it "lists genres names for given movie" do
      film.genres << genres.first
      film.genres << genres.second
      expect(list_genres(film)).to eq("#{genres.first.name}, #{genres.second.name}")
    end
  end

  describe "calculate_duration" do
    it "returns formatted duration for given film" do
      expect(calculate_duration(film)).to eq("#{film.duration / 60}h #{film.duration % 60}min")
    end
  end
end
