# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    let(:user) { build(:random_user) }
    it 'ensures nickname presence' do
      user.nickname = nil
      expect(user.save).to eq(false)
    end

    it 'ensures nickname length less than 16' do
      user.nickname = 'a' * 16
      expect(user.save).to eq(false)
    end

    it 'ensures nickname length greater than 2' do
      user.nickname = 'aa'
      expect(user.save).to eq(false)
    end
  end

  context 'friends scopes tests' do
    let(:users) { create_list(:random_user, 6) }
    puts '=' * 80
    before(:each) do
      Friendship.new(user_id: users[0].id, friend_id: users[1].id, accepted: true).save
      Friendship.new(user_id: users[2].id, friend_id: users[0].id).save
      Friendship.new(user_id: users[3].id, friend_id: users[0].id, accepted: true).save
      Friendship.new(user_id: users[0].id, friend_id: users[4].id).save
      Friendship.new(user_id: users[0].id, friend_id: users[5].id).save
    end

    it 'returns friends' do
      expect(users[0].friends.size).to eq(2)
    end

    it 'returns pending' do
      expect(users[0].pending.size).to eq(3)
    end

    it 'returns active_friends' do
      expect(users[0].active_friends.size).to eq(1)
    end

    it 'returns receved_friends' do
      expect(users[0].received_friends.size).to eq(1)
    end

    it 'returns pending_friends' do
      expect(users[0].pending_friends.size).to eq(2)
    end

    it 'returns requested_friendships' do
      expect(users[0].requested_friendships.size).to eq(1)
    end
  end

  context 'library scopes tests' do
    let(:user) { create(:random_user) }
    let(:films) { create_list(:film, 5) }
    let(:libraries) { build_list(:library, 5) }
    before(:each) do
      libraries.each_with_index.map do |library, i|
        library.film = films[i]
        library.user = user
        library.save
      end
    end

    it 'has films_seen' do
      expect(user.films_seen.size).to eq(5)
    end

    it 'has films_to_see' do
      libraries.last(2).map { |library| library.update(status_id: 2) }
      expect(user.films_to_see.size).to eq(2)
    end
  end
end
