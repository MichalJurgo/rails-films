# frozen_string_literal: true

# == Schema Information
#
# Table name: employments
#
#  id          :bigint(8)        not null, primary key
#  job_details :string
#  film_id     :bigint(8)
#  person_id   :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  job         :string
#

class Employment < ApplicationRecord
  validates :job, presence: true

  belongs_to :film
  belongs_to :person

  scope :as_actor, -> { where(job: 'actor') }
  scope :as_director, -> { where(job: 'director') }
  scope :as_screenwriter, -> { where(job: 'screenwriter') }
end
