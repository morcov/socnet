class NewfriendController < ApplicationController
    before_filter :check_if_current_user, only: [:index]

    def index
     @newfriends = current_user.newfriend.all
    end
 
    def create #true friend
      @newfriend = Newfriend.find(params[:format])

      @friend = Friend.new
      @friend.user_id = current_user.id
      @friend.friend_id = @newfriend.friend_id
      @friend.save

      @friend = nil

      @friend = Friend.new
      @friend.user_id = @newfriend.friend_id
      @friend.friend_id = current_user.id
      @friend.save

      @newfriend.destroy
      redirect_to :back
    end

    def destroy #false friend
    	@newfriend = Newfriend.find(params[:id])
    	@newfriend.destroy
      redirect_to :back
    end
end
