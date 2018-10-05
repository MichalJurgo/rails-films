# frozen_string_literal: true

# == Schema Information
#
# Table name: news
#
#  id         :bigint(8)        not null, primary key
#  heading    :string
#  body       :text
#  user_id    :bigint(8)
#  film_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class News < ApplicationRecord
  validates :heading, :body, presence: true

  has_many :comments, dependent: :destroy

  belongs_to :user
  belongs_to :film
end
