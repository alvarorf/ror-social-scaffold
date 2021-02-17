require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should fail if you try to create an empty user' do
    expect(User.new).to_not be_valid
  end
  it 'should be valid' do
    expect(User.new(name: 'User_#1', password: '123456', email: '123@123.com')).to be_valid
  end
end
