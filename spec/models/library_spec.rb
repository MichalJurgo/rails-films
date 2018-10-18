# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Library, type: :model do
  context 'validation tests' do
    let(:library) { build(:library_with_associations) }
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

  context 'scopes' do
    let!(:libraries) { create_list(:library_with_associations, 2) }
    it 'has seen scope' do
      expect(Library.seen.size).to eq(2)
    end

    it 'has to_see scope' do
      libraries.map { |library| library.update(status_id: 2) }
      expect(Library.to_see.size).to eq(2)
    end
  end
end
