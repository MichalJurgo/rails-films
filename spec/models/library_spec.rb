require 'rails_helper'

RSpec.describe Library, type: :model do
  context 'validation tests' do
    let(:user) { create(:random_user) }
    let(:film) { create(:film) }
    let(:library) { build(:library, user: user, film: film) }
    it 'ensures user_id presence' do
      library.user = nil
      expect(library.save).to eq(false)
    end

    it 'ensures film_id presence' do
      library.film = nil
      expect(library.save).to eq(false)
    end

    it 'ensures status_id presence' do
      library.status_id = nil
      expect(library.save).to eq(false)
    end
  end

  context 'scopes tests' do
    let(:user) { create(:random_user) }
    let(:film) { create(:film) }
    let(:libraries) { build_list(:library, 2) }
    it 'has seen scope' do
      libraries.map do |library|
        library.user = user
        library.film = film
        library.save
      end
      expect(Library.seen.size).to eq(2)
    end

    it 'has to_see scope' do
      libraries.map do |library|
        library.user = user
        library.film = film
        library.status_id = 2
        library.save
      end
      expect(Library.to_see.size).to eq(2)
    end
  end
end
