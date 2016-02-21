class Invitation < ActiveRecord::Base

  belongs_to :user, -> { where(:role => "guest") }
  belongs_to :reservation

  delegate :date, :to => :reservation
  delegate :duration, :to => :reservation
  delegate :restaurant, :to => :reservation

  delegate :first_name, :to => :user
  delegate :last_name, :to => :user

end
