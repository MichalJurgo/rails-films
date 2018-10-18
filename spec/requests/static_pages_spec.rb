require "rails_helper"

describe "Static pages requests", type: :request do
  describe "homepage" do
    let!(:news) { create_list(:news_with_associations, 7) }
    
    it "displays right title" do
      visit root_path
      expect(page).to have_selector("h1", text: "Rails Films")
    end

    it "displays recent news" do
      visit root_path
      expect(page).to have_selector(".news-preview", count: 6)
    end

    it "displays links to news" do
      visit root_path
      expect(page).to have_link("Read more", count: 6)
    end
  end
end