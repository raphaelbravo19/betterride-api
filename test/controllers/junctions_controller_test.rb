require 'test_helper'

class JunctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @junction = junctions(:one)
  end

  test "should get index" do
    get junctions_url, as: :json
    assert_response :success
  end

  test "should create junction" do
    assert_difference('Junction.count') do
      post junctions_url, params: { junction: { project_id: @junction.project_id } }, as: :json
    end

    assert_response 201
  end

  test "should show junction" do
    get junction_url(@junction), as: :json
    assert_response :success
  end

  test "should update junction" do
    patch junction_url(@junction), params: { junction: { project_id: @junction.project_id } }, as: :json
    assert_response 200
  end

  test "should destroy junction" do
    assert_difference('Junction.count', -1) do
      delete junction_url(@junction), as: :json
    end

    assert_response 204
  end
end
