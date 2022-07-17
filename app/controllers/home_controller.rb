class HomeController < ApplicationController
  def index
    @posts=Post.where("post_type = ? OR User_id = ?", 1, current_user.id).order(created_at: :desc)
    @users=User.all
    @comment=Comment.new
  end
end
