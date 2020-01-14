# frozen_string_literal: true

require "test_helper"

class ChatControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:non_admin_user)
  end

  test "get index" do
    get chat_index_url
    assert_response :success
  end
end
