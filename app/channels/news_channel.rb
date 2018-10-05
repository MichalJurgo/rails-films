# frozen_string_literal: true

class NewsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "news_#{params['news_id']}_channel"
  end

  def unsubscribed; end

  def send_comment(data)
    current_user.comments.create!(content: data['comment'], news_id: data['news_id'])
  end
end
