class Guest < User
  before_create :set_role

  default_scope { where(:role => "guest") }

  private

  def set_role
    self.role ||= "guest"
  end
end
