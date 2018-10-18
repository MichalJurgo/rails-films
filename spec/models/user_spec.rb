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

  context "methods" do
    let!(:user) { create(:random_user) }
    let!(:friendship) { create(:friendship_with_friend, user: user) }
    let(:film) { create(:film) }
    let!(:library) { create(:library, user: user, film: film) }
    let!(:review) { create(:review, film: film, user: user) }

    describe "#name" do
      it "returns user's full name if possible" do
        expect(user.name).to eq("#{user.firstname} #{user.lastname}")
      end

      it "returns 'user' when firstname and lastname not defined" do
        user.firstname = user.lastname = nil
        expect(user.name).to eq("User")
      end
    end

    describe "#friends" do
      it "returns user's friends" do
        friendship.update(accepted: true)
        expect(user.friends.size).to eq(1)
      end
    end

    describe "#pending" do
      it "returns pending friendships" do
        expect(user.pending.size).to eq(1)
      end
    end

    describe "#friends_with?" do
      it "returns true if user is a friend with given user" do
        friendship.update(accepted: true)
        expect(user.friends_with?(friendship.friend)).to eq(true)
      end
      
      it "returns false if user is not a friend with given user" do
        some_user = create(:random_user)
        expect(user.friends_with?(some_user)).to eq(false)
      end
    end

    describe "#friendship_with" do
      it "returns friendship with given user" do
        expect(user.friendship_with(friendship.friend)).to eq(friendship)
      end
    end

    describe "#friendship_requests" do
      it "returns friendships from received requests" do
        received_friendship = create(:friendship_with_user, friend: user)
        expect(user.friendship_requests.first).to eq(received_friendship)
      end
    end

    describe "#films" do
      it "returns all user's films" do
        expect(user.films.count).to eq(1)
        expect(user.films.first).to eq(library.film)
      end
    end

    describe "#film_review" do
      it "returns user's review for given film if it exists" do
        expect(user.film_review(film).first).to eq(review)
      end
    end

    describe "#average_rating" do
      it "returns user's average films rating" do
        some_review = create(:review_with_film, user: user, rating: 2)
        expect(user.average_rating).to eq(1.5)
      end
    end
  end
end
