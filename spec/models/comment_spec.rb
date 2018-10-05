require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation tests' do
    let(:user) { create(:random_user) }
    let(:film) { create(:film) }
    let(:news) { create(:news, user: user, film: film) }
    let(:comment) { build(:comment, user: user, news: news) }

    it 'ensures content presence' do
      comment.content = nil
      expect(comment.save).to eq(false)
    end

    it 'ensures content length less than 1000' do
      comment.content = 'a'*1001
      expect(comment.save).to eq(false)
    end
  end
end
