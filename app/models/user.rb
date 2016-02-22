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

  def friend?(guest)
    !self.friendships.where(:user_id => self.id, :friend_id => guest.id).empty?
  end

  private

  def set_role
    self.role ||= "guest"
  end

end
