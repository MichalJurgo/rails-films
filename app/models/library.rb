class Library < ApplicationRecord
  validates :status_id, presence: true

  belongs_to :user
  belongs_to :film

  scope :seen, -> { where(status_id: 1) }
  scope :to_see, -> { where(status_id: 2) }
end
