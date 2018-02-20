class User < ApplicationRecord
  devise :omniauthable, :database_authenticatable,
          :rememberable, :trackable, :validatable
end
