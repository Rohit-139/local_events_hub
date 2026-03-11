require "test_helper"

class Admin::ChatRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_chat_rooms_show_url
    assert_response :success
  end
end
