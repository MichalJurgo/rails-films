# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation tests' do
    let(:comment) { build(:comment_with_associations) }

    it 'ensures content presence' do
      comment.content = nil
      expect(comment.save).to eq(false)
    end

    it 'ensures content length less than 1000' do
      comment.content = 'a' * 1001
      expect(comment.save).to eq(false)
    end
  end
end
