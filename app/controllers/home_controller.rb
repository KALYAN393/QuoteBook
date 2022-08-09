class HomeController < ApplicationController
  def index
    # @posts=Post.published_posts(current_user.id)
    # @comment=Comment.new
    # @stories=Post.published_stories

    @home=HomePosts.new(current_user)

  end
  def show
    @sharedposts=Post.sharedposts(current_user.id)
  end
  
  def search
    
    # if params[:search].blank?
    #   redirect_to home_index_path and return
    # else
    # search_term = params[:search]
    # @tag=Tag.where("name LIKE ?","%#{search_term}%")
    # @PostsbyTag=Post.filtertags(@tag.ids.first)
    
    @search=SearchPosts.new(params[:search])



  end
end
end
