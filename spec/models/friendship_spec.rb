# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'validation tests' do
    let(:user) { build(:random_user) }
    let(:second_user) { build(:random_user) }
    let(:friendship) { build(:friendship, user: user, friend: second_user) }
    it 'ensures user_id presence' do
      friendship.user = nil
      expect(friendship.save).to eq(false)
    end

    it 'ensures friend_id presence' do
      friendship.friend = nil
      expect(friendship.save).to eq(false)
    end

    it 'ensures user_id and friend_id are different' do
      friendship.friend = user
      expect(friendship.save).to eq(false)
    end
  end
end
