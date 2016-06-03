# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'faker'
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Profile.destroy_all
Service.destroy_all


addresses =[
  "220 King St W, Suite 200, Toronto, ON M5H 1K4",
  "100 King St W, Suite 200, Toronto, ON M5H 1K4","27 King's College Cir, Toronto, ON M5S2",
  "224 Adelaide St W, Toronto", "719 College Street Toronto, ON M6G",
  "372 College Street, Toronto",
  "186 Ossington Ave, Toronto, ON M6J 2Z7",
  "572 College St, Toronto, ON M6G 1B3",
  "735 Queen St E, Toronto, ON M4M 1H2",
  "2804 Dundas St W, Toronto, ON M6P 1Y5",
  "722 College St, Toronto, ON M6G 1C5",
  "9 Ossington Ave, Toronto, ON M6J 2Y8"

]

startTime =[
  DateTime.new(2016,6,1,15,00),
  DateTime.new(2016,6,1,16,00),
  DateTime.new(2016,6,1,17,00),
  DateTime.new(2016,6,2,15,00),
  DateTime.new(2016,6,2,16,00),
  DateTime.new(2016,6,2,17,00),
  DateTime.new(2016,6,3,15,00),
  DateTime.new(2016,6,3,16,00),
  DateTime.new(2016,6,3,17,00),
  DateTime.new(2016,6,4,15,00)
]

endTime =[
  DateTime.new(2016,6,1,16,00),
  DateTime.new(2016,6,1,18,00),
  DateTime.new(2016,6,1,20,00),
  DateTime.new(2016,6,2,18,00),
  DateTime.new(2016,6,2,19,00),
  DateTime.new(2016,6,2,20,00),
  DateTime.new(2016,6,3,17,00),
  DateTime.new(2016,6,3,18,00),
  DateTime.new(2016,6,3,20,00),
  DateTime.new(2016,6,4,17,00)
]

rate =[15, 16, 17, 18, 20, 20, 25, 25, 30, 35]

# services = ["infant_care", "toddler_care", "tween_care", "teenage_care", "senior_care"].each do |c|
#    Service.create!({category: c})
# end





  10.times do |n|
     babysitter = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Number.number(4),photo: Faker::Avatar.image)


     parent = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Number.number(4),photo: Faker::Avatar.image)

     babysitter_profiles = babysitter.create_profile!(
       age: 40,
       description: "Fun and kind",
       exp_num: 4,
       education: "Harvard educated",
       language: "French",
       availability: "Full-time",
       travel_propensity: 30,
       transportation: "car",
       pets: true,
       phone_number: 666666666,
       address: addresses[n],
       rate: rate[n]

     )
     sleep 2

    #  babysitter_profiles.services << Service.all.sample

    #  parent.bookings.create!(
    #  start_time: startTime[n],
    #  end_time: endTime[n],
    #  address: "100 College Street, Toronto",
    #  confirmation:true,
    #  profile_id: babysitter_profiles.id
    #  )

  end
