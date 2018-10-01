class News < ApplicationRecord
  validates :heading, :body, presence: true

  belongs_to :user
  belongs_to :film
end
