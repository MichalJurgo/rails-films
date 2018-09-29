require 'rails_helper'

RSpec.describe User, type: :model do
  context 'friends scopes tests' do
    let(:users) { create_list(:random_user, 6) }
    puts "="*80
    before(:each) do
      Friendship.new(user_id: users[0].id, friend_id: users[1].id, accepted: true).save
      Friendship.new(user_id: users[2].id, friend_id: users[0].id).save
      Friendship.new(user_id: users[3].id, friend_id: users[0].id, accepted: true).save
      Friendship.new(user_id: users[0].id, friend_id: users[4].id).save
      Friendship.new(user_id: users[0].id, friend_id: users[5].id).save
    end

    it 'should return friends' do
      expect(users[0].friends.size).to eq(2)
    end

    it 'should return pending' do
      expect(users[0].pending.size).to eq(3)
    end

    it 'should return active_friends' do
      expect(users[0].active_friends.size).to eq(1)
    end

    it 'should return receved_friends' do
      expect(users[0].received_friends.size).to eq(1)
    end

    it 'should return pending_friends' do
      expect(users[0].pending_friends.size).to eq(2)
    end

    it 'should return requested_friendships' do
      expect(users[0].requested_friendships.size).to eq(1)
    end
  end
end
