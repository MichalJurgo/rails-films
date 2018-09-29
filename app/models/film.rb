class Film < ApplicationRecord
  serialize :production, Array

  validates :title, presence: true, length: { maximum: 50 }
  validates :short_description, length: { maximum: 200 }

  has_and_belongs_to_many :genres
end
