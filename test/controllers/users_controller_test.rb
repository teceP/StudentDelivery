# frozen_string_literal: true

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin_user)
    sign_in @user
  end

  test "should get userprofile index" do
    get profile_url
    assert_response :success
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "user should be unvalid - no password" do
    user1 = User.new(username: "user",
                     email: "my@email.de",
                     password: "")
    assert_not user1.valid?
  end

  test "user should be unvalid - wrong password - too short" do
    user1 = User.new(username: "user",
                     email: "my@email.de",
                     password: "1")
    assert_not user1.valid?
  end

  test "user should be unvalid - no email" do
    user1 = User.new(username: "user",
                     email: "",
                     password: "123123")
    assert_not user1.valid?
  end

  test "user should be unvalid - wrong email - no @" do
    user1 = User.new(username: "user",
                     email: "assdasd.de",
                     password: "123123")
    assert_not user1.valid?
  end

  test "user should be unvalid - wrong email - no .com" do
    user1 = User.new(username: "user",
                     email: "ass@das",
                     password: "123123")
    assert_not user1.valid?
  end

  test "user should be unvalid - wrong email - no prefix" do
    user1 = User.new(username: "user",
                     email: "@das.de",
                     password: "123123")
    assert_not user1.valid?
  end

  test "user should be unvalid - wrong email - no prefix before .de" do
    user1 = User.new(username: "user",
                     email: "asd@.de",
                     password: "123123")
    assert_not user1.valid?
  end

  test "user should be unvalid - wrong email - double point" do
    user1 = User.new(username: "user",
                     email: "asd@hi..de",
                     password: "123123")
    assert_not user1.valid?
  end
end
