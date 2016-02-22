class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant
  belongs_to :invitation
  belongs_to :reservation

end
