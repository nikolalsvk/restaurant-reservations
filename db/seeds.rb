# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p "Creating admin"
admin = Admin.new(:email => "admin@reservations.com",
                  :password => "adminadmin",
                  :password_confirmation => "adminadmin",
                  :confirmed_at => DateTime.now)
admin.skip_confirmation!
admin.save!



p "Creating restaurants and seats configurations"
res_eat_good = Restaurant.create!(:title => "Eat good",
                                  :description => "Vegan")
configuration_1 = SeatsConfiguration.new(:restaurant_id => res_eat_good.id)

20.times do |number|
  configuration_1.seats.new(:x => rand(10), :y => rand(10))
end
configuration_1.save!

every_nice = Restaurant.create!(:title => "Everything is nice here",
                                :description => "Meat")
configuration_1 = SeatsConfiguration.new(:restaurant_id => every_nice.id)

20.times do |number|
  configuration_1.seats.new(:x => rand(10), :y => rand(10))
end
configuration_1.save!

all_u_can_eat = Restaurant.create!(:title => "All you can eat",
                                   :description => "Vegetables")
configuration_1 = SeatsConfiguration.new(:restaurant_id => all_u_can_eat.id)

20.times do |number|
  configuration_1.seats.new(:x => rand(10), :y => rand(10))
end
configuration_1.save!



p "Creating managers"
first_names = [ "Nikola", "Branka", "John", "Peter", "Branko", "Zdravko", "Dragana" ]
last_names = [ "Jovanov", "Ras", "Pas", "Gars", "Leri", "Oldman", "Stasanov" ]
10.times do |number|
  manager = Manager.new(:email => "manager_#{number}@reservations.com",
                        :first_name => first_names[rand(6)],
                        :last_name => last_names[rand(6)],
                        :phone_number => "3435#{rand(100)}1#{rand(200)}",
                        :password => "managermanager",
                        :password_confirmation => "managermanager",
                        :restaurant => res_eat_good,
                        :confirmed_at => DateTime.now)
  manager.skip_confirmation!
  manager.save!
end



p "Creating users and reservations"
valid_email = [ "nikolaseap@gmail.com", "nikoladjuza@live.com", "nikolalsvk@yahoo.com",
                "brankabiber@gmail.com", "milosmitrovicmitke@gmail.com", "eilija@gmail.com",
                "mihailo93@gmail.com", "Rudakijevic93@gmail.com", "Kibo93@live.com",
                "baataa100@gmail.com" ]

valid_email.count.times do |number|
  guest = Guest.new(:email => valid_email[number],
                    :first_name => first_names[rand(6)],
                    :last_name => last_names[rand(6)],
                    :phone_number => "3435#{rand(100)}1#{rand(200)}",
                    :password => "guestguest",
                    :password_confirmation => "guestguest",
                    :confirmed_at => DateTime.now)
  guest.skip_confirmation!
  guest.save!

  5.times do
    Reservation.create!(:date => Time.now - rand(1..4).days,
                        :duration => 1,
                        :restaurant_id => rand(1..3),
                        :user_id => guest.id)


  end
end
