class IndexController < ApplicationController
  def index
  	if !current_user
  	  redirect_to log_in_path
  	else
  	  redirect_to member_path(current_user)
  	end
  end
end
