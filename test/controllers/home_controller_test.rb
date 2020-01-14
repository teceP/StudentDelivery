# frozen_string_literal: true

require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end
  test "should get shop" do
    get shop_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end

  test "should get contact" do
    get contact_path
    assert_response :success
  end
end
