class CommentsController < ApplicationController
   def create
	  @user = User.find(params[:user_id])
   # @post = Post.find(3)
      @comment = @post.comment.create(params[:comment].permit(:comment))
      @comment.author_id = current_user.id
      @comment.save
	  redirect_to member_path(@user)
  end

  def destroy
     @comment = Comment.find(params[:id])
     @comment.destroy
 
     redirect_to member_path(@user)
  end
end
