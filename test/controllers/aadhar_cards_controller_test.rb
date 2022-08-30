require "test_helper"

class AadharCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aadhar_cards_index_url
    assert_response :success
  end
end
