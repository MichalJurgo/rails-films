# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    birthday { '2018-09-30' }
    biography { Faker::Lorem.paragraph(3) }
    place_of_birth { "#{Faker::Address.city}, #{Faker::Address.country}" }
  end
end
