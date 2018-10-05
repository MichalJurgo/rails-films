# frozen_string_literal: true

module FilmsHelper
  def film_cast(film)
    roles = film.actors
    actors = []
    roles.each do |actor|
      hash = {}
      hash[:name] = actor.person.name
      hash[:role] = actor.role_details
      actors.push(hash)
    end
    actors
  end

  def list_production(film)
    film.production.join(', ')
  end

  def list_genres(film)
    genres = []
    film.genres.each do |genre|
      genres << genre.name
    end
    genres.join(', ')
  end

  def calculate_duration(film)
    "#{film.duration / 60}h #{film.duration % 60}min"
  end
end
