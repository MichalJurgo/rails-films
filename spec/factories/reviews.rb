# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    body { Faker::Lorem.paragraphs(10).join }
    rating { 1 }

    factory :review_with_associations do
      after(:build) do |review|
        review.user = create(:random_user)
        review.film = create(:film)
      end
    end

    factory :review_with_user do
      after(:build) do |review|
        review.user = create(:random_user)
      end
    end
    
    factory :review_with_film do
      after(:build) do |review|
        review.film = create(:film)
      end
    end
  end
end
