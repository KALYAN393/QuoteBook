class CommentsController < ApplicationController
  def create
    if user_signed_in?
      @comment=Comment.new(post_params)
      
      if @comment.save
        redirect_to home_index_path, flash: { success: "comment was created successfully!"}
     else
        redirect_to home_index_path, flash: { danger: "comment was not saved!"}
     end
    end
  end

  private
  def post_params
    params.require(:comment).permit(:User_id,:Post_id,:comment)
  end
end