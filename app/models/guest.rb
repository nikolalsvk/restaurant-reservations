class Guest < User
  before_create :set_role

  default_scope { where(:role => "guest") }

  private

  def set_role
    self.role ||= "guest"
  end

  def self.search(search)
    where("first_name ILIKE ? OR last_name ILIKE ? OR full_name ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
