# == Schema Information
#
# Table name: friendships
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  accepted   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendship < ApplicationRecord
  validate :check_ids_difference

  belongs_to :user
	belongs_to :friend, class_name: "User"

  def check_ids_difference
    errors.add(:friend_id, "can't be the same as user_id") if user_id == friend_id
  end
end
