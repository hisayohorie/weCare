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
User.destroy_all
Profile.destroy_all




10.times do
 User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Number.number(4),photo: Faker::Avatar.image)
 sleep 2
end




Profile.create!(
user_id: User.first.id,
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
address: '220 King St W, Suite 200, Toronto, ON M5H 1K4'

)



Profile.create!(
user_id: User.last.id,
age: 24,
description: "Smart and funny",
exp_num: 2,
education: "Highschool dropout",
language: "Spanish",
availability: "Part-time",
travel_propensity: 20,
transportation: "public transportation",
pets: false,
phone_number: 123123123,
address: '100 King St W, Suite 200, Toronto, ON M5H 1K4'

)



Profile.create!(
user_id: User.id(3),
age: 40,
description: "nice and caring",
exp_num: 10,
education: "Ph.D in chemistry",
language: "English",
availability: "Full-time",
travel_propensity: 50,
transportation: "car",
pets: true,
phone_number: 444444444,
address: '200 Queen St W, Suite 200, Toronto, ON M5H 1K4'

)
