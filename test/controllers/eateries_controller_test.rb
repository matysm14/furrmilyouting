require "test_helper"

class EateriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eateries_index_url
    assert_response :success
  end

  test "should get show" do
    get eateries_show_url
    assert_response :success
  end
end
