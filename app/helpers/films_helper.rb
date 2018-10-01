module FilmsHelper

  def list_production film
    film.production.join(', ')
  end
end
