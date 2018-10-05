# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employment, type: :model do
  context 'validation tests' do
    let(:person) { create(:person) }
    let(:film) { create(:film) }
    let(:employment) { build(:employment, person: person, film: film) }

    it 'ensures person presence' do
      employment.person = nil
      expect(employment.save).to eq(false)
    end

    it 'ensures film presence' do
      employment.film = nil
      expect(employment.save).to eq(false)
    end

    it 'ensures job presence' do
      employment.job = nil
      expect(employment.save).to eq(false)
    end
  end

  context 'scopes tests' do
    let(:person) { create(:person) }
    let(:film) { create(:film) }
    let(:employments) { build_list(:employment, 2) }
    before(:each) do
      employments.map do |e|
        e.person = person
        e.film = film
        e.save
      end
    end
    it 'has as_actor scope' do
      expect(Employment.as_actor.size).to eq(2)
    end

    it 'has as_director scope' do
      employments.map { |e| e.update(job: 'director') }
      expect(Employment.as_director.size).to eq(2)
    end

    it 'has as_screenwriter scope' do
      employments.map { |e| e.update(job: 'screenwriter') }
      expect(Employment.as_screenwriter.size).to eq(2)
    end
  end
end
