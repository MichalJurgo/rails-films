# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Film, type: :model do
  context 'validation tests' do
    let(:film) { build(:film) }
    it 'ensures title presence' do
      film.title = nil
      expect(film.save).to eq(false)
    end

    it 'ensures title maximum length' do
      film.title = 'a' * 51
      expect(film.save).to eq(false)
    end

    it 'ensures short_description maxium length' do
      film.short_description = 'a' * 201
      expect(film.save).to eq(false)
    end
  end

  context 'associations' do
    let(:film) { create(:film) }
    let(:person) { create(:person) }
    let(:genre) { create(:genre) }
    let(:employment) { create(:employment, film: film, person: person) }
    it 'has genres' do
      film.genres << genre
      expect(film.genres.size).to eq(1)
    end

    it 'has directors' do
      employment.update(job: 'director')
      expect(film.directors.size).to eq(1)
    end

    it 'has actors' do
      employment.update(job: 'actor')
      expect(film.actors.size).to eq(1)
    end

    it 'has screenwriters' do
      employment.update(job: 'screenwriter')
      expect(film.screenwriters.size).to eq(1)
    end
  end

  context "methods" do
    let(:film) { create(:film) }
    describe "#year" do
      it "returns release year" do
        expect(film.year).to eq(film.release.year)
      end
    end

    describe "#average_rating" do
      it "returns film's average rating" do
        review1 = create(:review_with_user, film: film, rating: 2)
        review2 = create(:review_with_user, film: film, rating: 3)
        expect(film.average_rating).to eq(2.5)
      end
    end
  end
end
