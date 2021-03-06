# frozen_string_literal: true

class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "news_#{comment.news.id}_channel", comment: render_comment(comment)
  end

  private

  def render_comment(comment)
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }
  end
end
