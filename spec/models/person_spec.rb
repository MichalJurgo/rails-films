# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'validation tests' do
    let(:person) { build(:person) }
    it 'ensures firstname presence' do
      person.firstname = nil
      expect(person.save).to eq(false)
    end

    it 'ensures lastname presence' do
      person.lastname = nil
      expect(person.save).to eq(false)
    end
  end

  context 'methods tests' do
    let(:person) { create(:person) }
    it 'has name method for full name' do
      expect(person.name).to eq("#{person.firstname} #{person.lastname}")
    end
  end

  context 'associations' do
    let(:person) { create(:person) }
    let(:employments) { build_list(:employment_with_associations, 2) }
    before(:each) do
      employments.map do |e|
        e.person = person
        e.save
      end
    end
    it 'has acting roles' do
      expect(person.acting_roles.size).to eq(2)
    end

    it 'has directed films' do
      employments.map { |e| e.update(job: 'director') }
      expect(person.directed_films.size).to eq(2)
    end

    it 'has written films' do
      employments.map { |e| e.update(job: 'screenwriter') }
      expect(person.written_films.size).to eq(2)
    end
  end
end
