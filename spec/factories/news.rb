# frozen_string_literal: true

FactoryBot.define do
  factory :news do
    heading { Faker::Lorem.paragraph(1) }
    body { Faker::Lorem.paragraphs(10).join }
    user { nil }
    film { nil }
  end
end
