class Person < ApplicationRecord
  validates :firstname, :lastname, presence: true

  def name
    "#{self.firstname} #{self.lastname}"
  end
end
