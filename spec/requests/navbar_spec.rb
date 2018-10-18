require "rails_helper"

describe "Navbar requests" do
  describe "Navbar is available" do
    context "when user not logged in" do
      it "shows the navbar on the homepage" do
        visit root_path
        expect(page).to have_link("Register")
        expect(page).to have_link("Login")
        expect(page).to have_link("Login with Facebook")
      end
    end
    
    context "when user logged in" do
      let(:user) { create(:random_user) }
      it "shows the navbar on the homepage" do
        login_as(user, scope: :user)
        visit root_path
        expect(page).to have_content("Notifications")
        expect(page).to have_content(user.name)
        expect(page).to have_selector(".gravatar")
      end
    end
  end
end