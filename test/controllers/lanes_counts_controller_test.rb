require 'test_helper'

class LanesCountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lanes_count = lanes_counts(:one)
  end

  test "should get index" do
    get lanes_counts_url, as: :json
    assert_response :success
  end

  test "should create lanes_count" do
    assert_difference('LanesCount.count') do
      post lanes_counts_url, params: { lanes_count: { lane: @lanes_count.lane, session_id: @lanes_count.session_id, user_id: @lanes_count.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show lanes_count" do
    get lanes_count_url(@lanes_count), as: :json
    assert_response :success
  end

  test "should update lanes_count" do
    patch lanes_count_url(@lanes_count), params: { lanes_count: { lane: @lanes_count.lane, session_id: @lanes_count.session_id, user_id: @lanes_count.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy lanes_count" do
    assert_difference('LanesCount.count', -1) do
      delete lanes_count_url(@lanes_count), as: :json
    end

    assert_response 204
  end
end
