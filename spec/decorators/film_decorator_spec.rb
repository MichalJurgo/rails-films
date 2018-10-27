require 'rails_helper'

RSpec.describe FilmDecorator do
  let(:film) { create(:film, production: ['USA', 'Canada', 'UK'], duration: 125) }
  let(:decorator) { film.decorate }

  describe '.production_list' do
    it 'returns countries separated by comma' do
      expect(decorator.production_list).to eq("USA, Canada, UK")
    end
  end

  describe '.genres_list' do
    let(:genres) { create_list(:genre, 2) }
    before do
      genres.each { |g| film.genres << g }
    end
    it 'returns genres separated by comma' do
      expect(decorator.genres_list).to eq("#{genres.first.name}, #{genres.second.name}")
    end
  end

  describe '.calculated_duration' do
    it 'returns formatted duration' do
      expect(decorator.calculated_duration).to eq("2h 5min")
    end
  end

  describe '.year' do
    it 'returns release year' do
      expect(decorator.year).to eq(film.release.year)
    end
  end

  describe '.average_rating' do
    it 'returns average rating' do
      review1 = create(:review_with_user, film: film, rating: 2)
      review2 = create(:review_with_user, film: film, rating: 3)
      expect(decorator.average_rating).to eq(2.5)
    end
  end
end
