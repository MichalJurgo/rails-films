# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraphs(3).join }
    
    factory :comment_with_associations do
      after(:build) do |comment|
        comment.user = create(:random_user)
        comment.news = create(:news_with_associations)
      end
    end
  end
end
