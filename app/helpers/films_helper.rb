# frozen_string_literal: true

module FilmsHelper
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
