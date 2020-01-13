FactoryBot.define do
  factory :user do
    email { "my@email.com" }
    password { "123123" }
    username { "myusername" }
  end
end
