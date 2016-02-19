# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Admin.new(:email => "admin@reservations.com",
                  :password => "adminadmin",
                  :password_confirmation => "adminadmin",
                  :confirmed_at => DateTime.now)
admin.skip_confirmation!
admin.save!

res_eat_good = Restaurant.create!(:title => "Eat good",
                                  :description => "Vegan")

manager = Manager.new(:email => "manager@reservations.com",
                      :password => "managermanager",
                      :password_confirmation => "managermanager",
                      :restaurant => res_eat_good,
                      :confirmed_at => DateTime.now)
manager.skip_confirmation!
manager.save!
