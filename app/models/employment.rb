class Employment < ApplicationRecord
  validates :job, presence: true

  belongs_to :film
  belongs_to :person

	scope :as_actor, -> { where(job: 'actor') }
	scope :as_director, -> { where(job: 'director') }
	scope :as_screenwriter, -> { where(job: 'screenwriter') }

end
