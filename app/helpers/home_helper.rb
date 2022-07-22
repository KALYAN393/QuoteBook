module HomeHelper

  def post_liked_by_user? post_id
    Like.where(Post_id: post_id, User_id: current_user.id).any?
  end
  
end
