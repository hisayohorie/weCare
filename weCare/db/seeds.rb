# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
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

100.times do
 User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: [Faker::Address.city, Faker::Address.street_address, Faker::Address.postcode].join(', '), email: Faker::Internet.email, photo: Faker::Avatar.image)
end
