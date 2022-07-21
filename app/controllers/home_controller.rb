class HomeController < ApplicationController
  def index
    @posts=Post.where("post_type = ? OR User_id = ?", 1, current_user.id).order(created_at: :desc)
    @users=User.all
    @comment=Comment.new
  end
   def show
    @sharedposts=Post.joins(:post_users).where(:post_users  => {user_id: current_user.id}).order(created_at: :desc)
    @users=User.all
    @comment=Comment.new
   end
  
   def search
    
    if params[:search].blank?
      redirect_to home_index_path and return
    else
    search_term = params[:search]
    @tag=Tag.where("name LIKE ?","%#{search_term}%")
    @PostsbyTag=Post.joins(:tags).where(:tags =>{id: @tag.ids.first},:posts=>{post_type: "universal"}).order(created_at: :desc)
   end
end
end
