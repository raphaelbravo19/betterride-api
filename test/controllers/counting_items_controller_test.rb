require 'test_helper'

class CountingItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @counting_item = counting_items(:one)
  end

  test "should get index" do
    get counting_items_url, as: :json
    assert_response :success
  end

  test "should create counting_item" do
    assert_difference('CountingItem.count') do
      post counting_items_url, params: { counting_item: { hour: @counting_item.hour, lanes_count_id: @counting_item.lanes_count_id, turn: @counting_item.turn, type: @counting_item.type } }, as: :json
    end

    assert_response 201
  end

  test "should show counting_item" do
    get counting_item_url(@counting_item), as: :json
    assert_response :success
  end

  test "should update counting_item" do
    patch counting_item_url(@counting_item), params: { counting_item: { hour: @counting_item.hour, lanes_count_id: @counting_item.lanes_count_id, turn: @counting_item.turn, type: @counting_item.type } }, as: :json
    assert_response 200
  end

  test "should destroy counting_item" do
    assert_difference('CountingItem.count', -1) do
      delete counting_item_url(@counting_item), as: :json
    end

    assert_response 204
  end
end
