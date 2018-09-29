FactoryBot.define do
  factory :genre do
    name { Faker::Lorem.words(1) }
  end
end
