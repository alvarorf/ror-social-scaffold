require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should fail if you try to create a post with an empty content' do
    expect(Post.new).to_not be_valid
  end
  it 'should be valid' do
    c = User.create(name: 'User1', password: '123456', email: '123@123.com')
    expect(Post.new(content: 'This is a test post.', user_id: c.id)).to be_valid
  end
end
