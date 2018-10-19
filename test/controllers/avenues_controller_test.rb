require 'test_helper'

class AvenuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avenue = avenues(:one)
  end

  test "should get index" do
    get avenues_url, as: :json
    assert_response :success
  end

  test "should create avenue" do
    assert_difference('Avenue.count') do
      post avenues_url, params: { avenue: { junction_id: @avenue.junction_id, n_lane: @avenue.n_lane, name: @avenue.name } }, as: :json
    end

    assert_response 201
  end

  test "should show avenue" do
    get avenue_url(@avenue), as: :json
    assert_response :success
  end

  test "should update avenue" do
    patch avenue_url(@avenue), params: { avenue: { junction_id: @avenue.junction_id, n_lane: @avenue.n_lane, name: @avenue.name } }, as: :json
    assert_response 200
  end

  test "should destroy avenue" do
    assert_difference('Avenue.count', -1) do
      delete avenue_url(@avenue), as: :json
    end

    assert_response 204
  end
end
