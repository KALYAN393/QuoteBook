class PostsController < ApplicationController
  
  def index
    @userpost = current_user.Posts if user_signed_in?
    @userposts=@userpost.order(created_at: :desc)

  end

  def new
    @post=Post.new
  end

  def create
    if user_signed_in?
    @post=Post.new(post_params)

    if @post.save!
      redirect_to home_index_path, flash: { success: "post was created successfully!"}
   else
      redirect_to new_post_path, flash: { danger: "post was not saved!"}
   end
  end
end


  private
  def post_params
    params.require(:post).permit(:text,:post_type,:User_id)
  end
end
