class Seat < ActiveRecord::Base

  belongs_to :configuration

  has_and_belongs_to_many :reservations

  def reserved?(time)
    return false if self.reservations.empty?

    self.reservations.each do |reservation|
      date_range = reservation.date.localtime..reservation.date.localtime + reservation.duration.hours
      if date_range.cover?(time.to_time)
        return true
      end
    end
    return false
  end

end
