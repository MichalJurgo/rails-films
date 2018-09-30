FactoryBot.define do
  factory :employment do
    employment_type_id { 1 }
    employment_details { "MyString" }
    film { nil }
    person { nil }
  end
end
