require 'rails_helper'

RSpec.describe Authentication, type: :model do
  let(:auth){
    {credentials: {token: "new-token-123456"}}
  }

  let(:exists_auth){
    authentication = FactoryBot.build(:authentication)
    {credentials: {token: authentication.token}, provider: authentication.provider, uid: authentication.uid}
  }

  it 'should be valid with full attributes' do
    authentication = FactoryBot.build(:authentication)
    expect(authentication).to be_valid
  end

  it 'should not be valid without provider' do
    authentication = FactoryBot.build(:authentication, provider: nil)
    expect(authentication).to_not be_valid
    expect(authentication.errors.added?(:provider, :blank)).to be true
  end

  it 'should not be valid without uid' do
    authentication = FactoryBot.build(:authentication, uid: nil)
    expect(authentication).to_not be_valid
    expect(authentication.errors.added?(:uid, :blank)).to be true
  end

  it 'should not be valid without token' do
    authentication = FactoryBot.build(:authentication, token: nil)
    expect(authentication).to_not be_valid
    expect(authentication.errors.added?(:token, :blank)).to be true
  end

  it 'should has an unique uid' do
    authentication_1 = FactoryBot.create(:authentication)
    authentication_2 = FactoryBot.build(:authentication, uid: authentication_1.uid)
    expect(authentication_2).to_not be_valid
    expect(authentication_2.errors.added?(:uid, :taken)).to be true
  end

  it 'should has an update_info method' do
    authentication = FactoryBot.create(:authentication)
    authentication.update_info(auth)
    expect(authentication.token).to eql(auth[:credentials][:token])
  end

  it 'should has a check_provider_existance as class method' do
    authentication = FactoryBot.create(:authentication)
    expect(Authentication.check_provider_existance(exists_auth).token).to eql(authentication.token)
  end
end
