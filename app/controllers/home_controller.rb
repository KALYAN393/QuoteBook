class HomeController < ApplicationController
  def index
    @posts=Post.published_posts(current_user.id)
    @comment=Comment.new
    @stories=Post.published_stories
  end
   def show
    @sharedposts=Post.sharedposts(current_user.id)
   end
  
   def search
    
    if params[:search].blank?
      redirect_to home_index_path and return
    else
    search_term = params[:search]
    @tag=Tag.where("name LIKE ?","%#{search_term}%")
    # @PostsbyTag=Post.joins(:tags).where(:tags =>{id: @tag.ids.first},:posts=>{post_type: "universal",isStory: false})
    @PostsbyTag=Post.filtertags(@tag.ids.first)
   end
end
end
