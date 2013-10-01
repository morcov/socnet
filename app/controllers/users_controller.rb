class UsersController < ApplicationController
 def new
  @user = User.new
 end

 def create
  @user = User.new(params[:user].permit(:email, :password, :password_confirmation, :first_name, :last_name, :country, :locality, :photo))
   if @user.save
    #redirect_to root_url, :notice => "Signed up!"
     redirect_to log_in_path
   else
    render "new"
   end
 end

 def edit
  @user = User.find(params[:id])
 end

 def update
 	@user = User.find(params[:id])
  if @user.update(params[:user].permit(:email, :first_name, :last_name, :country, :locality, :photo))
    redirect_to member_path(@user)
  else
    render 'edit'
  end
 end
end
