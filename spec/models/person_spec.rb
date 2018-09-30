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
end
