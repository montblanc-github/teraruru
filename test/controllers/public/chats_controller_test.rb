require 'test_helper'

class Public::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_chats_show_url
    assert_response :success
  end

end
