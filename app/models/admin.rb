class Admin < User
  before_create :set_role

  default_scope { where(:role => "admin") }

  private

  def set_role
    self.role ||= "admin"
  end
end
