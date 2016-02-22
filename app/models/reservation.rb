class Reservation < ActiveRecord::Base

  has_and_belongs_to_many :seats
  has_many :invitations
  has_one :review

  belongs_to :restaurant
  belongs_to :user

  validates_presence_of :date
  validates_presence_of :duration

  delegate :title, :to => :restaurant

  def expired?
    date_range = self.date.localtime..self.date.localtime + self.duration.hours

    unless date_range.cover?(Time.now)
      unless self.review.present?
        self.create_review!(:restaurant_id => self.restaurant.id,
                            :user_id => self.user.id)
      end
    end

    !date_range.cover?(Time.now)
  end

end
