require 'rails_helper'

RSpec.describe 'users/sign_up', type: :view do
  describe 'the signup process', type: :feature do
    it 'signs me up' do
      visit '/users/sign_up'
      within('#new_user') do
        fill_in 'Name', with: 'user2'
        fill_in 'Email', with: 'user2@example.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
      end
      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end
end
