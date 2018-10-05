# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraphs(3).join }
    user { nil }
    news { nil }
  end
end
