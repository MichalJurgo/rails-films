# == Schema Information
#
# Table name: reviews
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  film_id    :bigint(8)
#  body       :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ApplicationRecord
  validates :body, presence: true, length: { maximum: 2000 }
  validates :rating, inclusion: 1..10

  belongs_to :user
  belongs_to :film
end
