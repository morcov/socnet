class User < ActiveRecord::Base
  #has_many :message
  has_many :friend
  has_many :newfriend

	has_secure_password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def full_name
    "#{first_name} #{last_name}"
  end

  def get_count_newfriend
   Newfriend.where(user_id: self.id).count
  end

  has_attached_file :photo, :styles => { :small => "250x300>", :detail => "100x100>" }
  
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
