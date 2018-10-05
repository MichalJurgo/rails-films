# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'validation tests' do
    let!(:user) { User.create(email: 'sienkiewicz@example.com', password: '123456', password_confirmation: '123456') }
    it 'ensures user_id presence' do
      friendship = Friendship.new(friend_id: user.id, accepted: false)
      expect(friendship).to_not be_valid
    end

    it 'ensures friend_id presence' do
      friendship = Friendship.new(user_id: user.id, accepted: false)
      expect(friendship).to_not be_valid
    end

    it 'ensures user_id and friend_id are different' do
      friendship = Friendship.new(user_id: user.id, friend_id: user.id, accepted: false)
      expect(friendship).to_not be_valid
    end
  end
end
