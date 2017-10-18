require 'test_helper'

class SendMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get action" do
    get send_messages_action_url
    assert_response :success
  end

  test "should get index" do
    get send_messages_index_url
    assert_response :success
  end

end
