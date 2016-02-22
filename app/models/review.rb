class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant
  belongs_to :invitation
  belongs_to :reservation

  def reservation
    self[:reservation_id] ? Reservation.find(self[:reservation_id]) : self.invitation.reservation
  end

end
