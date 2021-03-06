# frozen_string_literal: true

User.create!(
  email: 'skrzetuski@example.com',
  firstname: 'Jan',
  lastname: 'Skrzetuski',
  nickname: 'skrzetuski',
  birthday: Date.parse('1630-12-12'),
  password: 'asdfgh',
  password_confirmation: 'asdfgh'
)

User.create!(
  email: 'zagloba@example.com',
  firstname: 'Jan',
  lastname: 'Zagłoba',
  nickname: 'zagloba',
  birthday: Date.parse('1620-10-30'),
  password: 'asdfgh',
  password_confirmation: 'asdfgh',
  roles: (:editor)
)

Genre.create!(name: 'History')
Genre.create!(name: 'Adventure')
Genre.create!(name: 'Western')
Genre.create!(name: 'Thriller')
Genre.create!(name: 'Biography')
Genre.create!(name: 'Musical')

Film.create!(title: 'Ogniem i Mieczem',
             short_description: 'Adaptacja powieści Sienkiewicza,
                                 pierwsza część trylogii.',
             description: Faker::Lorem.paragraphs(10).join,
             production: ['Polska'],
             release: Date.parse('1999-02-08'),
             duration: 175)

Film.create!(title: 'Django',
             short_description: 'O łowcy nagród i czarnoskórym niewolniku.',
             description: Faker::Lorem.paragraphs(10).join,
             production: ['USA'],
             release: Date.parse('2012-12-11'),
             duration: 165)

Film.create!(title: 'Infiltracja',
             short_description: 'Tajny policjant i informator mafii.',
             description: Faker::Lorem.paragraphs(10).join,
             production: %w[Hongkong USA],
             release: Date.parse('2006-10-06'),
             duration: 152)

Film.create!(title: 'Król rozrywki',
             short_description: "Historia amerykańskiego artysy, P.T. Barnuma,
              założyciela cyrku.",
             description: Faker::Lorem.paragraphs(10).join,
             production: ['USA'],
             release: Date.parse('2017-12-20'),
             duration: 105)

Film.create!(title: 'Młoda Wiktoria',
             short_description: "Wiktoria zostaje królową Zjednoczonego Królestwa
              Wielkiej Brytanii.",
             description: Faker::Lorem.paragraphs(10).join,
             production: ['USA', 'Wielka Brytania'],
             release: Date.parse('2009-03-06'),
             duration: 100)

Film.all.each do |film|
  film.genres << Genre.all.sample
end

Status.create!(name: 'Seen')
Status.create!(name: 'To see')

Film.all.each do |film|
  for i in 1..10 do
    person = Person.create!(
      firstname: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      birthday: Faker::Date.between(80.years.ago, 25.years.ago),
      place_of_birth: "#{Faker::Address.city}, #{Faker::Address.country}",
      biography: Faker::Lorem.paragraphs(10).join
    )
    if i == 1
      Employment.create!(film: film, person: person, job: 'director')
    elsif i == 2
      Employment.create!(film: film, person: person, job: 'screenwriter')
    else
      Employment.create!(film: film, person: person, job: 'actor',
                         job_details: Faker::StarWars.character)
    end
  end
end

20.times do
  News.create!(
    heading: Faker::Lorem.paragraph(1),
    body: Faker::Lorem.paragraphs(10).join,
    film: Film.all.sample,
    user: User.all.sample
  )
end
