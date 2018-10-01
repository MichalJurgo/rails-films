class Genre < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :films

  def self.list_genres
    genres = Array.new
    Genre.all.each do |g|
      genres << g.name
    end
    genres
  end
end
