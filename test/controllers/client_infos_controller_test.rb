require "test_helper"

class ClientInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_info = client_infos(:one)
  end

  test "should get index" do
    get client_infos_url, as: :json
    assert_response :success
  end

  test "should create client_info" do
    assert_difference("ClientInfo.count") do
      post client_infos_url, params: { client_info: { body: @client_info.body, description: @client_info.description, subject: @client_info.subject, user_id: @client_info.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show client_info" do
    get client_info_url(@client_info), as: :json
    assert_response :success
  end

  test "should update client_info" do
    patch client_info_url(@client_info), params: { client_info: { body: @client_info.body, description: @client_info.description, subject: @client_info.subject, user_id: @client_info.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy client_info" do
    assert_difference("ClientInfo.count", -1) do
      delete client_info_url(@client_info), as: :json
    end

    assert_response :no_content
  end
end
