# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'validation tests' do
    let(:review) { build(:review) }

    it 'ensures body presence' do
      review.body = nil
      expect(review.save).to eq(false)
    end

    it 'ensures body length lower than 2000' do
      review.body = 'a' * 2001
      expect(review.save).to eq(false)
    end

    it 'ensures rating between 1 and 10' do
      review.rating = 11
      expect(review.save).to eq(false)
    end
  end
end
