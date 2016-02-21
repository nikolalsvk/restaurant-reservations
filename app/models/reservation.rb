class Reservation < ActiveRecord::Base

  has_and_belongs_to_many :seats
  has_many :invitations

  validates_presence_of :date
  validates_presence_of :duration

end
