# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'faker'
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'faker'
#
# User.create({100.times do |parent|
#   parent.first_name:Faker::Name.first_name
#   parent.last_name:Faker::Name.last_name
#   parent.address:Faker::Address.address
#   parent.email:Faker::Email.email
#   parent.photo:Faker::Avatar.image
# end})

# User.destroy_all
# Profile.destroy_all
#
#
# # addresses = ['220 King St W, Suite 200, Toronto, ON M5H 1K4',]
#
# 10.times do |n|
#  u = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Number.number(4),photo: Faker::Avatar.image)
#  u.profile.create!(
#  age: 56,
#  description: "Fun and kind",
#  exp_num: 4,
#  education: "Havard educated",
#  language: "French",
#  availability: "Full-time",
#  travel_propensity: 30,
#  transportation: "car",
#  pets: true,
#  phone_number: 666666666
#  # address: addresses[n]
#
#  )
#  sleep 2
# end
#

User.destroy_all
Profile.destroy_all

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


10.times do |n|
 u = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Number.number(4),photo: Faker::Avatar.image)
 sleep 2

 u.create_profile(
   age: 56,
   description: "Fun and kind",
   exp_num: 4,
   education: "Havard educated",
   language: "French",
   availability: "Full-time",
   travel_propensity: 30,
   transportation: "car",
   pets: true,
   phone_number: 666666666,
   address: addresses[n]
 )
 sleep 2
end
