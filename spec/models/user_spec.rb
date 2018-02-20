require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be valid with full attributes' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it 'should not be valid without email' do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to_not be_valid
    expect(user.errors.added?(:email, :blank)).to be true
  end

  it 'should not be valid without password' do
    user = FactoryBot.build(:user, password: nil)
    expect(user).to_not be_valid
    expect(user.errors.added?(:password, :blank)).to be true
  end
end
