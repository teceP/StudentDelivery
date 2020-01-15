# frozen_string_literal: true

require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:non_admin_user)
    @message = messages(:one)
  end

  test "should create message" do
    assert_difference("Message.count") do
      post messages_url, params: { message: { content: @message.content, user_email: @message.user_email } }
    end
  end
end
