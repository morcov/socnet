class Message < ActiveRecord::Base
 belongs_to :user_id
 has_ancestry

  def full_name
    User.find(self.author_id).full_name
  end

  def photo
    User.find(self.author_id).photo
  end
end
