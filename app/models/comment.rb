# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :news

  validates :content, presence: true, length: { maximum: 1000 }

  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
