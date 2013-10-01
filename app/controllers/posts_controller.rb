class PostsController < ApplicationController
   def create
	    @user = User.find(params[:user_id])
      @post = @user.post.create(params[:post].permit(:post))
      @post.author_id = current_user.id
      @post.save
	  redirect_to member_path(@user)
  end

  def destroy
     @user = User.find(params[:user_id])
     @post = Post.find(params[:id])
     @post.destroy
 
     redirect_to member_path(@user)
  end

end
