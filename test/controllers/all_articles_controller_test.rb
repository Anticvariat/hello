require 'test_helper'

class AllArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get all_articles_index_url
    assert_response :success
  end

end
