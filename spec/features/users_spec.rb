require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    before(:each) do
      visit new_user_registration_path
      within('form') do
        fill_in 'user_email', with: 'sienkiewicz@example.com'
        fill_in 'user_password', with: '123456'
      end
    end

    scenario 'should be successful' do
      within('form') do
        fill_in 'user_password_confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'should fail' do
      within('form') do
        fill_in 'user_password_confirmation', with: '123457'
      end
      click_button 'Sign up'
      expect(page).to have_content('Password confirmation doesn\'t match Password')
    end
  end

  context 'log user in' do
    let!(:user) { User.create(email: 'sienkiewicz@example.com', password: '123456', password_confirmation: '123456') }
    before(:each) do
      visit new_user_session_path
    end

    scenario 'should be successful' do
      within('form') do
        fill_in 'user_email', with: 'sienkiewicz@example.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end

    scenario 'should fail' do
      within('form') do
        fill_in 'user_email', with: 'sienkiewicz@example.com'
        fill_in 'user_password', with: '123457'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end

  context 'log user out' do
    let!(:user) { User.create(email: 'sienkiewicz@example.com', password: '123456', password_confirmation: '123456') }
    before(:each) do
      login_as(user, scope: :user)
    end

    scenario 'should be successful' do
      visit root_path
      click_link('Logout')
      expect(page).to have_content 'Signed out successfully.'
    end
  end

  context 'update user' do
    let!(:user) { User.create(email: 'sienkiewicz@example.com', password: '123456', password_confirmation: '123456') }
    before(:each) do
      login_as(user, scope: :user)
      visit edit_user_registration_path(user)
    end

    scenario 'should be successful' do
      within('form') do
        fill_in 'user_firstname', with: 'Henryk'
        fill_in 'user_lastname', with: 'Sienkiewicz'
        fill_in 'user_current_password', with: user.password
      end
      click_button 'Update'
      expect(page).to have_content 'Your account has been updated successfully.'
    end

    scenario 'should fail' do
      within('form') do
        fill_in 'user_firstname', with: 'a'*31
        fill_in 'user_lastname', with: 'a'*31
      end
      click_button 'Update'
      expect(page).to have_content 'Current password can\'t be blank'
      expect(page).to have_content 'Firstname is too long'
      expect(page).to have_content 'Lastname is too long'
    end
  end
end
