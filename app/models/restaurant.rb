class Restaurant < ActiveRecord::Base
  has_many :managers
  has_one :seats_configuration

  validates_presence_of :title

  before_create :tap_configuration

  private

  def tap_configuration
    self.build_seats_configuration
  end

end
