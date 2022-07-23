class HomeController < ApplicationController
  def index
    @posts=Post.where("(post_type = ? OR User_id = ?) AND isStory = ?", 1, current_user.id,false).order(created_at: :desc)
    @comment=Comment.new
    @stories=Post.where("isStory = ?",true).order(created_at: :desc)
  end
   def show
    @sharedposts=Post.joins(:post_users).where(:post_users  => {user_id: current_user.id},:posts=>{isStory: false}).order(created_at: :desc)
   end
  
   def search
    
    if params[:search].blank?
      redirect_to home_index_path and return
    else
    search_term = params[:search]
    @tag=Tag.where("name LIKE ?","%#{search_term}%")
    @PostsbyTag=Post.joins(:tags).where(:tags =>{id: @tag.ids.first},:posts=>{post_type: "universal",isStory: false}).order(created_at: :desc)
   end
end
end
