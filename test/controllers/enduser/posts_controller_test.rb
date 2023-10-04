require "test_helper"

class Enduser::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enduser_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get enduser_posts_show_url
    assert_response :success
  end
end
