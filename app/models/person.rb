# frozen_string_literal: true

# == Schema Information
#
# Table name: people
#
#  id             :bigint(8)        not null, primary key
#  firstname      :string
#  lastname       :string
#  birthday       :date
#  biography      :text
#  place_of_birth :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Person < ApplicationRecord
  validates :firstname, :lastname, presence: true

  has_many :employments
  has_many :acting_roles, -> { Employment.as_actor }, class_name: 'Employment'
  has_many :directed_films, -> { Employment.as_director }, class_name: 'Employment'
  has_many :written_films, -> { Employment.as_screenwriter }, class_name: 'Employment'

  def name
    "#{firstname} #{lastname}"
  end
end
