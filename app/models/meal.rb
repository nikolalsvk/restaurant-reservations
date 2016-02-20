class Meal < ActiveRecord::Base

  belongs_to :menu

  validates_presence_of :title

end
