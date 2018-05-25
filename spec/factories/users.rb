FactoryBot.define do
  factory :user do
    email "test@test.com"
    password "12345678"
    confirm password "12345678"
  end
end
