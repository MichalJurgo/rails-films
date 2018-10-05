# frozen_string_literal: true

FactoryBot.define do
  factory :library do
    user { nil }
    film { nil }
    status_id { 1 }
  end
end
