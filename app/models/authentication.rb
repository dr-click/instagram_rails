class Authentication < ApplicationRecord
  validates :uid, :provider, :token, presence: true
  validates_uniqueness_of :uid, :scope => :provider

  belongs_to :user

  def update_info(auth)
    self.token = auth[:credentials][:token]
  end

  def self.check_provider_existance(auth_hash)
    authentication = Authentication.where(provider: auth_hash[:provider], uid: auth_hash[:uid]).first
    authentication ||= Authentication.new()
  end
end
