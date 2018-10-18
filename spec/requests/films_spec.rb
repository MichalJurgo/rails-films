require "rails_helper"

describe "Films requests" do
  describe "films list" do
    let!(:films) { create_list(:film, 5) }
    before(:each) do
      visit "/films"
    end
    it "displays the right title" do
      expect(page).to have_selector("h1", text: "Films")
    end

    it "displays films" do
      expect(page).to have_selector(".single-film", count: 5)
    end

    it "displays filter block" do
      expect(page).to have_selector("h2", text: "Filter results")
      expect(page).to have_selector(".films-filters")
    end
  end

  describe "film page" do
    let!(:film) { create(:film) }
    let!(:employment) { create(:employment_with_person, film: film) }
    let!(:review) { create(:review_with_user, film: film) }
    let!(:news) { create(:news_with_user, film: film) }
    before(:each) do
      visit "/films/#{film.id}"
    end

    it "displays film title" do
      expect(page).to have_selector("h1", text: film.title)
    end

    it "displays short description" do
      expect(page).to have_content(film.short_description)
    end
    
    it "displays description" do
      expect(page).to have_content(film.description)
    end

    it "displays film details" do
      expect(page).to have_selector(".film-details")
    end

    it "displays film cast" do
      expect(page).to have_content(film.actors.first.person.name)
    end

    it "displays recent reviews" do
      expect(page).to have_selector("h3", text: "Recent reviews")
      expect(page).to have_content(film.reviews.first.body[0...40])
    end

    it "displays film rating" do
      expect(page).to have_content(review.rating.to_f)
    end

    it "displays recent news" do
      expect(page).to have_selector("h3", text: "Recent news")
      expect(page).to have_link(film.news.last.heading)
    end
  end
end