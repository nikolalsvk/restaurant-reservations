class Invitation < ActiveRecord::Base

  belongs_to :user, -> { where(:role => "guest") }
  belongs_to :reservation

  has_one :review

  delegate :date, :to => :reservation
  delegate :duration, :to => :reservation
  delegate :restaurant, :to => :reservation

  delegate :first_name, :to => :user
  delegate :last_name, :to => :user

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
