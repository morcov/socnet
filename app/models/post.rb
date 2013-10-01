class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comment, dependent: :destroy

  def author
    User.find(self.author_id).full_name
  end
end
