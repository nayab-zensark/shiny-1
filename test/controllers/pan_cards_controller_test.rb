require "test_helper"

class PanCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pan_cards_index_url
    assert_response :success
  end
end
