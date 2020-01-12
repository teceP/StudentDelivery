# frozen_string_literal: true

require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end


  test "should create line_item" do
    assert_difference("LineItem.count") do
      post line_items_url, params: { line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id } }
    end
    # todo product id
    assert_redirected_to line_item_url(LineItem.last)
  end


  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { cart_id: @line_item.cart_id, product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference("LineItem.count", -1) do
      delete line_item_url(@line_item)
    end
    # todo cart id
    assert_redirected_to line_items_url
  end
end
