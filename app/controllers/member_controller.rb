class MemberController < ApplicationController
  before_filter :check_if_current_user, only: [:index, :create, :show]
  before_filter :you_are_who, only: [:create]


  def index
  	@users = User.all

    @newfriends = Newfriend.all
    @friends = Friend.all

  end

  def show
  	@user = User.find(params[:id])
  end

  def create #Application to friends
   #  user = User.find(params[:format]) # vide def you_are_who
     @newfriend = Newfriend.new
     @newfriend.friend_id = current_user.id
     @newfriend.user_id = @user.id
     @newfriend.save
     redirect_to member_index_path
  
  end

  private
  def you_are_who
    @user = User.find(params[:format])
    @newfriend = Newfriend.where(user_id: @user.id, friend_id: current_user.id).take
    @newfriend2 = Newfriend.where(user_id: current_user.id, friend_id: @user.id).take
    @friend = Friend.where(user_id: @user.id, friend_id: current_user.id).take

    redirect_to member_index_path unless @newfriend == nil && @newfriend2 == nil && @friend == nil
  end

end
