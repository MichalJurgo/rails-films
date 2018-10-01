require 'rails_helper'

RSpec.describe News, type: :model do
  context 'validation test' do
    let(:news) { build(:news) }
    let(:user) { build(:random_user) }
    let(:film) { build(:film) }
    before(:each) do
      news.user = user
      news.film = film
    end
    it 'ensures heading presence' do
      news.heading = nil
      expect(news.save).to eq(false)
    end

    it 'ensures body presence' do
      news.body = nil
      expect(news.save).to eq(false)
    end

    it 'ensures user presence' do
      news.user = nil
      expect(news.save).to eq(false)
    end

    it 'ensures film presence' do
      news.film = nil
      expect(news.save).to eq(false)
    end
  end
end
