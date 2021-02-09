require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should fail if you try to create an empty comment' do
    expect(Comment.new).to_not be_valid
  end
  it 'should be valid' do
    u = User.create(name: 'User_#3', password: '123456', email: '123@123.com')
    p = Post.create(content: 'This is a test post.', user_id: u.id)
    expect(Comment.new(user_id: u.id, post_id: p.id, content: 'This is a test comment')).to be_valid
  end
end
