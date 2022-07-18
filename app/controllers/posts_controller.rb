class PostsController < ApplicationController
  
  def index
    @userpost = Post.where(User_id: current_user.id)
    @userposts=@userpost.order(created_at: :desc)

  end

  def new
    @post=Post.new
  end

  def create
    if user_signed_in?
    @post=Post.new(post_params)

    if @post.save
      redirect_to home_index_path, flash: { success: "post was created successfully!"}
   else
     render 'new'
   end
  end
end

def destroy

  @post=Post.find(params[:id])
  @post.destroy

  respond_to do |format|
    format.html { redirect_to posts_url, status: :see_other, notice: "Post was successfully destroyed." }
    format.json { head :no_content }
  end
end

  private
  def post_params
    params.require(:post).permit(:text,:post_type,:User_id, tag_ids: [], user_ids: [])
  end
end
