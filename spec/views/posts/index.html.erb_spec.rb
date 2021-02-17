require 'rails_helper'

RSpec.describe "posts/create", type: :view do
  describe "the creation of a post", type: :feature do
    before :each do
      User.create(name: 'user', email: 'user@example.com', password: 'password')
    end

    it "Creates a post successfully" do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      #within("#user_password") do
      click_button 'Log in'
      visit '/posts'
      within("#new_post") do
        fill_in 'post_content', with: 'Test post'
        #fill_in 'Password', with: 'password'
      end
      click_button 'Save'
      expect(page).to have_content 'Post was successfully created.'
    end
  end

  describe "Making a comment in his own post", type: :feature do
    before :each do
      User.create(name: 'user', email: 'user@example.com', password: 'password')
    end

    it "Creates a post successfully" do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      #within("#user_password") do
      click_button 'Log in'
      visit '/posts'
      within("#new_post") do
        fill_in 'post_content', with: 'Test post'
        #fill_in 'Password', with: 'password'
      end
      click_button 'Save'
      expect(page).to have_content 'Post was successfully created.'
      visit '/posts'
      within("#new_comment") do
        fill_in 'comment_content', with: 'Comment 1 made by user on his own post (post 1).'
        #fill_in 'Password', with: 'password'
      end
      click_button 'Comment'
      expect(page).to have_content 'Comment was successfully created.'
    end
  end
end
