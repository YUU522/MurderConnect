require "test_helper"

class Enduser::CalendersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enduser_calenders_index_url
    assert_response :success
  end
end
