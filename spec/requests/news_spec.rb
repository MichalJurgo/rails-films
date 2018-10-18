require "rails_helper"

describe "News requests" do
  describe "news list" do
    let!(:news) { create_list(:news_with_associations, 6) }
    before(:each) do
      visit "/news"
    end

    it "has the right title" do
      expect(page).to have_selector("h1", text: "News")
    end

    it "displays last 6 news" do
      news.each do |news|
        expect(page).to have_link(news.heading)
      end
    end
  end
end