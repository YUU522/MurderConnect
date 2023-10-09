require "test_helper"

class Enduser::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get followings" do
    get enduser_relationships_followings_url
    assert_response :success
  end

  test "should get followers" do
    get enduser_relationships_followers_url
    assert_response :success
  end
end
