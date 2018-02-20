require 'rails_helper'

RSpec.describe User, type: :model do
  let(:auth){
    {
      credentials: {token: "new-token-123456"},
      extra: {raw_info: {
        username: 'mostafa-ragab'
        }}
    }
  }

  it 'should be valid with full attributes' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it 'should be valid without email' do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to be_valid
    expect(user.errors.added?(:email, :blank)).to be false
  end

  it 'should not be valid without password' do
    user = FactoryBot.build(:user, password: nil)
    expect(user).to_not be_valid
    expect(user.errors.added?(:password, :blank)).to be true
  end

  it 'should has an update_info method' do
    user = FactoryBot.create(:user)
    user.update_info(auth)
    expect(user.username).to eql(auth[:extra][:raw_info][:username])
  end

  it 'should has an link_to_social_networks method' do
    user = FactoryBot.build(:user)
    expect(user.authentications.length).to eql(0)
    user.link_to_social_networks(auth)
    expect(user.authentications.length).to eql(1)
    expect(user.authentications.first.token).to eql(auth[:credentials][:token])
  end
end
