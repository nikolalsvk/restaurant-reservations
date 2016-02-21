class Seat < ActiveRecord::Base

  belongs_to :configuration

  has_and_belongs_to_many :reservations

  def reserved?(time)
    return false if self.reservations.empty?

    self.reservations.each do |reservation|
      if reservation
        date = reservation.date..reservation.date + reservation.duration
        if date.include?(time) == true
          return true
        end
      else
        return false
      end
    end
  end

end
