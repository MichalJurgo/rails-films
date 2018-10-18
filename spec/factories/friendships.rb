# frozen_string_literal: true

FactoryBot.define do
  factory :friendship do
    accepted { false }

    factory :friendship_with_associations do
      after(:build) do |friendship|
        friendship.user = create(:random_user)
        friendship.friend = create(:random_user)
      end
    end
    
    factory :friendship_with_friend do
      after(:build) do |friendship|
        friendship.friend = create(:random_user)
      end
    end

    factory :friendship_with_user do
      after(:build) do |friendship|
        friendship.user = create(:random_user)
      end
    end
  end
end
