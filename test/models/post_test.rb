require "test_helper"

class PostTest < ActiveSupport::TestCase

  test "post should not save without text" do
   post=Post.new
   assert_not post.save
  end



end
