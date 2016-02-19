class Guest < User
  before_create :set_role

  private

  def set_role
    self.role = "guest" unless self.role
  end
end
