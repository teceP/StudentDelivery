# frozen_string_literal: true

require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    sign_in users(:admin_user)
    get carts_url
    assert_response :success
  end

  test "shouldn't get index no_admin" do
    sign_in users(:non_admin_user)
    get carts_url
    assert_response :redirect
    assert_equal "Missing Privileges", flash[:notice]
    assert_redirected_to root_path
  end


  test "shouldn't get index no_user" do
    get carts_url
    assert_response :redirect
    assert_equal "Please log in", flash[:notice]
    assert_redirected_to "/users/sign_in"
  end

  test "should show cart" do
    sign_in users(:non_admin_user)
    # todo problem with session
    get carts_url(@cart), params: {cart_id: @cart.id}
    assert_response :redirect
  end

  test "shouldn't show cart no_admin" do
    sign_in users(:non_admin_user)
    get carts_url(@cart)
    assert_response :redirect
    assert_equal "Missing Privileges", flash[:notice]
    assert_redirected_to root_path
  end

  test "shouldn't show cart no_user" do
    get carts_url(@cart)
    assert_response :redirect
    assert_equal "Please log in", flash[:notice]
  end

  test "should update cart" do
    sign_in users(:admin_user)
    patch cart_url(@cart), params: {cart: {}}
    assert_redirected_to cart_url(@cart)
  end

  test "shouldn't update cart no_admin" do
    sign_in users(:non_admin_user)
    patch cart_url(@cart), params: {cart: {}}
    assert_response :redirect
    assert_equal "Missing Privileges", flash[:notice]
    assert_redirected_to root_path
  end

  test "shouldn't update cart no_user" do
    patch cart_url(@cart), params: {cart: {}}
    assert_response :redirect
    assert_equal "Please log in", flash[:notice]
    assert_redirected_to "/users/sign_in"
  end

  test "should destroy cart" do
    sign_in users(:admin_user)
    delete cart_url(carts(:one))
    assert_redirected_to root_path
  end

  test "should destroy cart no_admin" do
    sign_in users(:non_admin_user)
    delete cart_url(carts(:one))
    assert_redirected_to root_path
  end

  test "shouldn't destroy cart no_user" do
    delete cart_url(carts(:one))
    assert_redirected_to "/users/sign_in"
  end
end
