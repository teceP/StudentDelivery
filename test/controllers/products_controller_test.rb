# frozen_string_literal: true

require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:admin_user)
    get new_product_url
    assert_response :success
  end

  test "shouldn't get new non_admin" do
    sign_in users(:non_admin_user)
    get new_product_url
    assert_response :redirect
    assert_equal "Missing Privileges", flash[:notice]
  end

  test "shouldn't get new non_user" do
    get new_product_url
    assert_response :redirect
    assert_equal "Please log in", flash[:notice]
  end

  test "should create product" do
    sign_in users(:admin_user)
    assert_difference("Product.count") do
      post products_url, params: { product: { price: @product.price, title: @product.title } }
    end

    assert_redirected_to shop_path
  end

  test "shouldn't create product non_admin" do
    sign_in users(:non_admin_user)
    post products_url, params: { product: { price: @product.price, title: @product.title } }
    assert_response :redirect
    assert_equal "Missing Privileges", flash[:notice]
    assert_redirected_to root_path
  end

  test "shouldn't create product non_user" do
    post products_url, params: { product: { price: @product.price, title: @product.title } }
    assert_response :redirect
    assert_equal "Please log in", flash[:notice]
    assert_redirected_to "/users/sign_in"
  end

  test "should get edit" do
    sign_in users(:admin_user)
    get edit_product_url(@product)
    assert_response :success
  end

  test "shouldn't get edit non_admin" do
    sign_in users(:non_admin_user)
    get edit_product_url(@product)
    assert_response :redirect
    assert_equal "Missing Privileges", flash[:notice]
    assert_redirected_to root_path
  end

  test "shouldn't get edit non_user" do
    get edit_product_url(@product)
    assert_response :redirect
    assert_equal "Please log in", flash[:notice]
    assert_redirected_to "/users/sign_in"
  end

  test "should update product" do
    sign_in users(:admin_user)
    patch product_url(@product), params: { product: { price: @product.price, title: @product.title } }
    assert_redirected_to product_url(@product)
  end

  test "shouldn't update product non_admin" do
    sign_in users(:non_admin_user)
    patch product_url(@product), params: { product: { price: @product.price, title: @product.title } }
    assert_response :redirect
    assert_equal "Missing Privileges", flash[:notice]
    assert_redirected_to root_path
  end

  test "shouldn't update product non_user" do
    patch product_url(@product), params: { product: { price: @product.price, title: @product.title } }
    assert_response :redirect
    assert_equal "Please log in", flash[:notice]
    assert_redirected_to "/users/sign_in"
  end


  test "should destroy product" do
    sign_in users(:admin_user)
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end


  test "shouldn't destroy product non_admin" do
    sign_in users(:non_admin_user)
    delete product_url(@product)
    assert_response :redirect
    assert_equal "Missing Privileges", flash[:notice]
    assert_redirected_to root_path
  end

  test "shouldn't destroy product non_user" do
    delete product_url(@product)
    assert_response :redirect
    assert_equal "Please log in", flash[:notice]
    assert_redirected_to "/users/sign_in"
  end
end
