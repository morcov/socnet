class Friend < ActiveRecord::Base
  belongs_to :user

  def full_name
    User.find(self.friend_id).full_name
  end

  def photo
    User.find(self.friend_id).photo
  end
end
