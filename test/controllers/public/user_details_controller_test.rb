require "test_helper"

class Public::UserDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_user_details_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_user_details_edit_url
    assert_response :success
  end
end
