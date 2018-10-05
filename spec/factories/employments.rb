# frozen_string_literal: true

FactoryBot.define do
  factory :employment do
    job_details { 'whatever' }
    film { nil }
    person { nil }
    job { 'actor' }
  end
end
