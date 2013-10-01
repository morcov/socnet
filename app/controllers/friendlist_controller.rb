class FriendlistController < ApplicationController
  before_filter :check_if_current_user, only: [:index]

  def index
  #  if params[:id].present?
    	@friends = current_user.friend.all
  #  else
      
  #  end
  end

  def show
    @user = User.find(params[:format])
    @friends = @user.friend.all
  end

  def destroy #фтопку такого друга #destroy friend
  	@friend = Friend.find(params[:id]) #Знахожу по id номер рядка з записом про дружбу
   
   if @friend.user_id == current_user.id
    @friend2 = Friend.where(user_id: @friend.friend_id, friend_id: current_user.id).take #Знахожу протилежне значення по своєму id
    @friend.destroy
  	@friend2.destroy
   end
  	redirect_to friends_path
  end
end
