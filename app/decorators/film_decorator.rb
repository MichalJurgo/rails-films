class FilmDecorator < Draper::Decorator
  delegate_all

  def production_list
    object.production.join(', ')
  end

  def genres_list
    genres = []
    object.genres.each do |genre|
      genres << genre.name
    end
    genres.join(', ')
  end

  def calculated_duration
    "#{object.duration / 60}h #{object.duration % 60}min"
  end

  def year
    object.release.year
  end

  def average_rating
    object.reviews.average(:rating).to_f.round(1)
  end
end
