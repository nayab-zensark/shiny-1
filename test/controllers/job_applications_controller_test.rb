require "test_helper"

class JobApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_applications_index_url
    assert_response :success
  end
end
