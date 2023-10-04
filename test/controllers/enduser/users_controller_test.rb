require "test_helper"

class Enduser::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get enduser_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get enduser_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get enduser_users_update_url
    assert_response :success
  end

  test "should get confirm_withdrawal" do
    get enduser_users_confirm_withdrawal_url
    assert_response :success
  end

  test "should get withdrawal" do
    get enduser_users_withdrawal_url
    assert_response :success
  end

  test "should get favorite" do
    get enduser_users_favorite_url
    assert_response :success
  end

  test "should get participant" do
    get enduser_users_participant_url
    assert_response :success
  end
end
