require "test_helper"

class PostTest < ActiveSupport::TestCase

  
  test "post should not save without text" do
   post=Post.new
   assert_not post.save
  end

  test "post should save " do
    post=Post.new(text: "testing a post to save")
    assert post.save
   end



end
# /Users/nkalyan/Desktop/QouteBook/test/models/post_test.rb