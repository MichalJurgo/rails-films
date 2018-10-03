class Review < ApplicationRecord
  validates :body, presence: true, length: { maximum: 2000 }
  validates :rating, inclusion: 1..10

  belongs_to :user
  belongs_to :film
end
