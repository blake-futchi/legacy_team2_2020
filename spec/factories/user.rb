FactoryBot.define do
  factory :user do
    name { "String" }
    email { "String@string.com" }
    password { "password1234" }
  end
end