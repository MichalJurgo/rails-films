FactoryBot.define do
  factory :film do
    title { "Star Wars" }
    description { Faker::Lorem.paragraph(2) }
    short_description { Faker::Lorem.sentences(1) }
    duration { 120 }
    release { "2018-09-29" }
    production { ["USA", "Great Britain"] }
  end
end
