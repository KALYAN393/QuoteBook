module HomeHelper

  def post_liked_by_user? post_id
    Like.where(Post_id: post_id, User_id: current_user.id).any?
  end

  def isPost? post_id
    a=Post.find_by(id: post_id)
    if a.isStory 
      return false 
    elsif a.isStory==nil   
      return true
    else
        return true
    end

  end
  
end
