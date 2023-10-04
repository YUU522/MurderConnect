require "test_helper"

class Enduser::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get enduser_homes_top_url
    assert_response :success
  end
end
