class Manager < User
  before_create :set_role

  default_scope { where(:role => "manager") }

  private

  def set_role
    self.role ||= "manager"
  end
end
