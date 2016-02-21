class SeatsConfiguration < ActiveRecord::Base
  belongs_to :restaurant

  has_many :seats

  def seat?(x, y)
    !self.seats.where(:x => x, :y => y).empty?
  end

  def seat_reserved?(x, y, time)
    seat = self.seats.where(:x => x, :y => y)
    seat.first.reserved?(time)
  end

end
