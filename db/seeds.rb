# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: "skrzetuski@example.com",
  firstname: "Jan",
  lastname: "Skrzetuski",
  birthday: Date.parse("1630-12-12"),
  password: "asdfgh",
  password_confirmation: "asdfgh"
)

Genre.create!(name: "History")
Genre.create!(name: "Adventure")
Genre.create!(name: "Western")
Genre.create!(name: "Thriller")
Genre.create!(name: "Biography")
Genre.create!(name: "Musical")

20.times do
  Film.create!(
    title: Faker::Lorem.word,
    description: Faker::Lorem.paragraph(3),
    short_description: Faker::Lorem.sentence(1),
    duration: rand(60..180),
    release: Faker::Date.between(40.years.ago, Date.today),
    production: [Faker::Address.country]
  )
end

Film.all.each do |film|
  film.genres << Genre.all.sample
end

Status.create!(name: "Seen")
Status.create!(name: "To see")

20.times do
  Person.create!(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    birthday: Faker::Date.between(80.years.ago, 25.years.ago),
    place_of_birth: "#{Faker::Address.city}, #{Faker::Address.country}",
    biography: Faker::Lorem.paragraph(3)
  )
end

5.times do
  Employment.create!(
    person: Person.all.sample,
    film: Film.all.sample,
    job: ['actor', 'director', 'screenwriter'].sample
  )
end
