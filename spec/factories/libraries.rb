# frozen_string_literal: true

FactoryBot.define do
  factory :library do
    status_id { 1 }

    factory :library_with_associations do
      after(:build) do |library|
        library.user = create(:random_user)
        library.film = create(:film)
      end
    end
    
    factory :library_with_film do
      after(:build) do |library|
        library.film = create(:film)
      end
    end
  end
end
