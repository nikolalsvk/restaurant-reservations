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
    end
  end

  def friend?(guest)
    !self.friendships.where(:user_id => self.id, :friend_id => guest.id).empty?
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
