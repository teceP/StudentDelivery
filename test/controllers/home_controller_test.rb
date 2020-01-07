# frozen_string_literal: true

require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end

  test "Switch to dark mode" do
    visit root_path
    click_on "darkSwitch"
    assert_response :true
  end
end

