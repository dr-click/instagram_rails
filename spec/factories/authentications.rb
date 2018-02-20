FactoryBot.define do
  factory :authentication do
    user          {association(:user)}
    provider      "instagram"
    uid           "123456"
    token         "123456-654321-010101"
    token_secret  ""
  end
end
