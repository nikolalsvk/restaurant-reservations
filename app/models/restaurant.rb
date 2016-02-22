class Restaurant < ActiveRecord::Base

  has_many :managers, -> { where(:role => "manager") }
  has_one :seats_configuration
  has_many :reviews

  validates_presence_of :title

  before_create :tap_configuration


  private

  def tap_configuration
    self.build_seats_configuration
  end

end
