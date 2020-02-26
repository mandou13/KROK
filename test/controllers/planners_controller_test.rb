require 'test_helper'

class PlannersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get planners_show_url
    assert_response :success
  end

  test "should get create" do
    get planners_create_url
    assert_response :success
  end

  test "should get update" do
    get planners_update_url
    assert_response :success
  end

end
