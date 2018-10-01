class Film < ApplicationRecord
  serialize :production, Array

  validates :title, presence: true, length: { maximum: 50 }
  validates :short_description, length: { maximum: 200 }

  has_and_belongs_to_many :genres
  has_many :employments
  has_many :people, through: :employments
  has_many :directors, -> { Employment.as_director }, through: :employments, source: :person
  has_many :actors, -> { Employment.as_actor }, through: :employments, source: :person
  has_many :screenwriters, -> { Employment.as_screenwriter }, through: :employments, source: :person
end
