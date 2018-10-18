# frozen_string_literal: true

FactoryBot.define do
  factory :employment do
    job_details { 'whatever' }
    job { 'actor' }

    factory :employment_with_associations do
      after(:build) do |employment|
        employment.person = create(:person)
        employment.film = create(:film)
      end
    end
    
    factory :employment_with_person do
      after(:build) do |employment|
        employment.person = create(:person)
      end
    end
  end
end
