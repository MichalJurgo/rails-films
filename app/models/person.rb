class Person < ApplicationRecord
  validates :firstname, :lastname, presence: true

  has_many :employments
  has_many :acting_roles, -> { Employment.as_actor }, class_name: 'Employment'
  has_many :directed_films, -> { Employment.as_director }, class_name: 'Employment'
  has_many :written_films, -> { Employment.as_screenwriter }, class_name: 'Employment'

  def name
    "#{self.firstname} #{self.lastname}"
  end
end
