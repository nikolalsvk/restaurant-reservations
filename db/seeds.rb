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
every_nice = Restaurant.create!(:title => "Everything is nice here",
                                  :description => "Meat")

manager = Manager.new(:email => "manager@reservations.com",
                      :password => "managermanager",
                      :password_confirmation => "managermanager",
                      :restaurant => res_eat_good,
                      :confirmed_at => DateTime.now)
manager.skip_confirmation!
manager.save!

10.times do |number|
  guest = Guest.new(:email => "guest_#{number}@reservations.com",
                    :password => "guestguest",
                    :password_confirmation => "guestguest",
                    :confirmed_at => DateTime.now)
  guest.skip_confirmation!
  guest.save!
end
