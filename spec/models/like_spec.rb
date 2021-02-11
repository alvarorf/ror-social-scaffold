require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'should fail if you try to create an empty like' do
    expect(Like.new).to_not be_valid
  end
  it 'should be valid' do
    u = User.create(name: 'User_#2', password: '123456', email: '123@123.com')
    p = Post.create(content: 'This is a test post.', user_id: u.id)
    expect(Like.new(user_id: u.id, post_id: p.id)).to be_valid
  end
end
