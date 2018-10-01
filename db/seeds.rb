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

User.create!(
  email: "zagloba@example.com",
  firstname: "Jan",
  lastname: "Zagłoba",
  birthday: Date.parse("1620-10-30"),
  password: "asdfgh",
  password_confirmation: "asdfgh"
)

Genre.create!(name: "History")
Genre.create!(name: "Adventure")
Genre.create!(name: "Western")
Genre.create!(name: "Thriller")
Genre.create!(name: "Biography")
Genre.create!(name: "Musical")

Film.create!(title: "Ogniem i Mieczem",
              short_description: "Adaptacja powieści Sienkiewicza, pierwsza część trylogii.",
              description: Faker::Lorem.paragraphs(10).join,
              production: ["Polska"],
              release: Date.parse("1999-02-08"),
              duration: 175)

Film.create!(title: "Django",
              short_description: "O łowcy nagród i czarnoskórym niewolniku.",
              description: Faker::Lorem.paragraphs(10).join,
              production: ["USA"],
              release: Date.parse("2012-12-11"),
              duration: 165)

Film.create!(title: "Infiltracja",
              short_description: "Tajny policjant i informator mafii.",
              description: Faker::Lorem.paragraphs(10).join,
              production: ["Hongkong", "USA"],
              release: Date.parse("2006-10-06"),
              duration: 152)

Film.create!(title: "Król rozrywki",
              short_description: "Historia amerykańskiego artysy, P.T. Barnuma,
              założyciela cyrku.",
              description: Faker::Lorem.paragraphs(10).join,
              production: ["USA"],
              release: Date.parse("2017-12-20"),
              duration: 105)

Film.create!(title: "Młoda Wiktoria",
              short_description: "Wiktoria zostaje królową Zjednoczonego Królestwa
              Wielkiej Brytanii.",
              description: Faker::Lorem.paragraphs(10).join,
              production: ["USA", "Wielka Brytania"],
              release: Date.parse("2009-03-06"),
              duration: 100)

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
    biography: Faker::Lorem.paragraphs(10).join
  )
end

5.times do
  Employment.create!(
    person: Person.all.sample,
    film: Film.all.sample,
    job: ['actor', 'director', 'screenwriter'].sample
  )
end

20.times do
  News.create!(
    heading: Faker::Lorem.paragraph(1),
    body: Faker::Lorem.paragraphs(10).join,
    film: Film.all.sample,
    user: User.all.sample
  )
end
