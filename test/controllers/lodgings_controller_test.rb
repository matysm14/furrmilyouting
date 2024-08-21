require "test_helper"

class LodgingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lodgings_index_url
    assert_response :success
  end

  test "should get show" do
    get lodgings_show_url
    assert_response :success
  end
end
