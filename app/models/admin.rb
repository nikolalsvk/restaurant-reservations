class Admin < User
  before_create :set_role

  private

  def set_role
    self.role = "admin" unless self.role
  end
end
