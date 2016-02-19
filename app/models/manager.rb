class Manager < User
  before_create :set_role

  private

  def set_role
    self.role = "manager" unless self.role
  end
end
