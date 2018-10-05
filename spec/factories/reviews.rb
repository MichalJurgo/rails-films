# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    user { nil }
    film { nil }
    body { Faker::Lorem.paragraphs(10).join }
    rating { 1 }
  end
end
