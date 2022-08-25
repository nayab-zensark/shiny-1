require "test_helper"

class ProductTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_tags_index_url
    assert_response :success
  end
end
