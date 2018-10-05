# frozen_string_literal: true

# == Schema Information
#
# Table name: libraries
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  film_id    :bigint(8)
#  status_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Library < ApplicationRecord
  validates :status_id, presence: true

  belongs_to :user
  belongs_to :film

  scope :seen, -> { where(status_id: 1) }
  scope :to_see, -> { where(status_id: 2) }
end
