require 'rails_helper'

RSpec.describe "users/sign_in", type: :view do
  describe "the signin process", type: :feature do
    before :each do
      User.create(name: 'user', email: 'user@example.com', password: 'password')
    end

    it "signs me in" do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      #within("#user_password") do
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
