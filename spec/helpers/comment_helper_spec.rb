require 'rails_helper'
RSpec.describe CommentHelper, type: :helper do
  describe '#filter_friends_comments' do
    it 'should return the comment in the right format' do
      u = User.create(name: 'user', email: 'user@example.com', password: 'password')
      allow(helper).to receive(:current_user) { u }
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      po = Post.create(content: 'post', user_id: u.id)
      co = Comment.create(content: 'comment', post_id: po.id, user_id: u.id)
      a = "<p class=\"comment-data\">Made by: #{u.name}</p>"
      b = "<p  class=\"comment-data\">#{co.content}</p>"
      c = "<p class=\"comment-data\"> Made at : #{co.created_at.strftime('%Y/%m/%d')}</p>"
      d = b + a + c
      expect(helper.filter_friends_comments(co)).to eql(d.html_safe)
    end
  end
end
