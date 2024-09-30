require "test_helper"

class LodgingReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get lodging_reviews_create_url
    assert_response :success
  end

  test "should get edit" do
    get lodging_reviews_edit_url
    assert_response :success
  end

  test "should get update" do
    get lodging_reviews_update_url
    assert_response :success
  end

  test "should get destroy" do
    get lodging_reviews_destroy_url
    assert_response :success
  end
end
