require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new,create,show" do
    get posts_new,create,show_url
    assert_response :success
  end
end
