# frozen_string_literal: true

require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end


  test "should create line_item" do
    assert_difference("LineItem.count") do
      post line_items_url, params: { product_id: @line_item.product_id }
    end
    assert_response :redirect
    assert_redirected_to carts_url(@line_item.id)
  end


  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference("LineItem.count", -1) do
      delete line_item_url(@line_item), params: { session: @line_item.cart_id }
    end
    # todo cart id
    assert_redirected_to line_items_url
  end
end
