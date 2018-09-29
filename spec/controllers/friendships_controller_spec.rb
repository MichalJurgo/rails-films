require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  let(:users) { create_list(:random_user, 2) }
  describe 'POST #create' do
    it 'should save new friendship in the database' do
      friendship = Friendship.new(user_id: users[0].id, friend_id: users[1].id)
      expect { friendship.save }.to change(Friendship, :count).by(1)
    end
  end

  describe 'PUT #update' do
    it 'should update friendship' do
      friendship = Friendship.create(user_id: users[0].id, friend_id: users[1].id)
      friendship.update(accepted: true)
      expect(friendship.accepted).to eq(true)
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete friendship' do
      friendship = Friendship.create(user_id: users[0].id, friend_id: users[1].id)
      expect { friendship.delete }.to change(Friendship, :count).by(-1)
    end
  end
end
