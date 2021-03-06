# frozen_string_literal: true

# == Schema Information
#
# Table name: genres
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Genre < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :films

  def self.list_genres
    Genre.pluck(:name)
  end
end
