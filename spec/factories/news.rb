# frozen_string_literal: true

FactoryBot.define do
  factory :news do
    heading { Faker::Lorem.paragraph(1) }
    body { Faker::Lorem.paragraphs(10).join }

    factory :news_with_associations do
      after(:build) do |news|
        news.user = create(:random_user)
        news.film = create(:film)
      end
    end
    
    factory :news_with_user do
      after(:build) do |news|
        news.user = create(:random_user)
      end
    end
  end
end
