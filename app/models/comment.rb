class Comment < ActiveRecord::Base
  belongs_to :post

  def author
    User.find(self.author_id).full_name
  end

  def user_id
    Post.find(self.post_id).user_id
  end
end
