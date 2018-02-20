class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:instagram]

  has_many :authentications

  def update_info(auth)
    self.username = auth[:extra][:raw_info][:username]
  end

  def link_to_social_networks(auth)
    self.authentications.build(provider: auth[:provider], uid: auth[:uid], token: auth[:credentials][:token])
    self
  end

  def force_remember_me
    self.password = Devise.friendly_token[0,20]
    self.devise_pwd = true
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
