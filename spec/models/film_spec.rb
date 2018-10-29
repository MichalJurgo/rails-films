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
    let(:genres) { create_list(:genre, 4)}
    let(:employment) { create(:employment, film: film, person: person) }
    it 'has genres' do
      film.genres << genres[0..2]
      expect(film.genres.size).to eq(3)
    end

    it 'has maximum of 3 genres' do
      film.genres << genres
      expect(film.genres.size).to eq(3)
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
end
