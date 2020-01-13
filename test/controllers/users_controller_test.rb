# frozen_string_literal: true

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    @user = FactoryBot.create(:user)
    sign_in @user
    get users_index
    assert_response :success
  end
end
