# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "my@email.com" }
    password { "mypassword" }
    username { "myusername" }
    bio { "mybio" }
    subject { "ai" }
  end
end
