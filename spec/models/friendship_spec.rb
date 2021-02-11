require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it 'should fail if you try to create an empty friendship' do
    expect(Friendship.new).to_not be_valid
  end
  it 'should be valid' do
    u1 = User.create(name: 'User_#5', password: '123456', email: '123@123.com')
    u2 = User.create(name: 'User_#6', password: '123456', email: '456@456.com')
    expect(Friendship.new(user_id: u1.id, friend_id: u2.id, confirmed: false)).to be_valid
  end
end
