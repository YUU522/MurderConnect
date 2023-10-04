require "test_helper"

class Enduser::ParticipantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enduser_participants_index_url
    assert_response :success
  end

  test "should get show" do
    get enduser_participants_show_url
    assert_response :success
  end
end
