class Friendship < ActiveRecord::Base

  belongs_to :guest, :foreign_key => :user_id

  validates_presence_of :user_id
  validates_presence_of :friend_id

  def friend
    Guest.find(self.friend_id)
  end

end
