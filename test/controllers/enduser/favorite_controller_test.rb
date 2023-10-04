require "test_helper"

class Enduser::FavoriteControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get enduser_favorite_create_url
    assert_response :success
  end

  test "should get destroy" do
    get enduser_favorite_destroy_url
    assert_response :success
  end
end
