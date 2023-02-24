require "test_helper"

class RejectedFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rejected_file = rejected_files(:one)
  end

  test "should get index" do
    get rejected_files_url, as: :json
    assert_response :success
  end

  test "should create rejected_file" do
    assert_difference("RejectedFile.count") do
      post rejected_files_url, params: { rejected_file: { client_info_id: @rejected_file.client_info_id, reason_of_rejection: @rejected_file.reason_of_rejection, user_id: @rejected_file.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show rejected_file" do
    get rejected_file_url(@rejected_file), as: :json
    assert_response :success
  end

  test "should update rejected_file" do
    patch rejected_file_url(@rejected_file), params: { rejected_file: { client_info_id: @rejected_file.client_info_id, reason_of_rejection: @rejected_file.reason_of_rejection, user_id: @rejected_file.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy rejected_file" do
    assert_difference("RejectedFile.count", -1) do
      delete rejected_file_url(@rejected_file), as: :json
    end

    assert_response :no_content
  end
end
