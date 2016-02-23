class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  belongs_to :restaurant

  has_many :friendships
  has_many :invitations
  has_many :reservations
  has_many :reviews

  before_create :set_role
  before_save :set_full_name

  def admin?
    self.role == "admin"
  end

  def guest?
    self.role == "guest"
  end

  def manager?
    self.role == "manager"
  end

  def restaurant_manager(restaurant)
    self.restaurant_id == restaurant.id
  end

  def friends_rating(restaurant_id)
    ratings = []

    self.friendships.each do |friendship|
      avg_rating = friendship.friend.reviews.where(:restaurant_id => restaurant_id).average(:rating).to_f
      ratings << avg_rating unless avg_rating == 0
    end

    if ratings.count == 0
      return "Not rated yet"
    else
      rating = ratings.sum / ratings.count
      rating.round(2)
    end
  end

  def friend?(guest)
    !self.friendships.where(:user_id => self.id, :friend_id => guest.id).empty?
  end

  def friendship(friend)
    Friendship.where(:user_id => self.id, :friend_id => friend.id).first
  end

  def common_visits(friend)
    if self.reviews || !self.reviews.empty?
      visits = 0
      self.reviews.each do |review|
        if review.reservation.user.id == friend.id
          visits = visits + 1
        else
          visits = visits + review.reservation.invitations.where(:user_id => friend.id, :confirmed => true).count
        end
      end
      return visits
    else
      return "You haven't been anywhere"
    end
  end

  private

  def set_role
    self.role ||= "guest"
  end

  def set_full_name
    if self.first_name && self.last_name
      self.full_name = "#{self.first_name} #{self.last_name}"
    end
  end

end
