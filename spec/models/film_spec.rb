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

  context 'association tests' do
    let(:film) { create(:film) }
    let(:genre) { create(:genre) }
    let(:person) { create(:person) }
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
end
