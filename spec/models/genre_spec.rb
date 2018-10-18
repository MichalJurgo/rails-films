# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre, type: :model do
  context 'validation tests' do
    let(:genre) { build(:genre) }
    it 'ensures name presence' do
      genre.name = nil
      expect(genre.save).to eq(false)
    end
  end

  context 'association' do
    let(:genre) { create(:genre) }
    let(:films) { create_list(:film, 3) }
    it 'has multiple films' do
      films.each.map { |film| film.genres << genre }
      expect(genre.films.size).to eq(3)
    end
  end

  context "methods" do
    let!(:genres) { create_list(:genre, 2) }
    describe ".list_genres" do
      it "returns array with all genres names" do
        expect(Genre.list_genres).to eq(genres.map{|g| g.name})
      end
    end
  end
end
