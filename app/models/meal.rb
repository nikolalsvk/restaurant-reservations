class Meal < ActiveRecord::Base

  belongs_to :menu

  validates_presence_of :title
  validates_presence_of :price

end
