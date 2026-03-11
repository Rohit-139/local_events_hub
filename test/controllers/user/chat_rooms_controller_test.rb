require "test_helper"

class User::ChatRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_chat_rooms_show_url
    assert_response :success
  end
end
