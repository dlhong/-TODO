# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require "open-uri"

# 10.times do
#   Activity.create(summary: Faker::Fantasy::Tolkien.poem,
#               name: Faker::Game.title,
#               address: Faker::Address.full_address,
#               contact_info: Faker::PhoneNumber,
#               price: rand(50..200))
# end

# url = "https://api.openbrewerydb.org/breweries"
# activity_serialized = URI.open(url).read
# activity = JSON.parse(activity_serialized)

# puts "Starting the seed"
# i = 1
# for i in 1..15 do
#   Activity.create(summary: activity[i]["brewery_type"],
#                   name: activity[i]["name"],
#                   address: [activity[i]["street"], activity[i]["city"]],
#                   contact_info: activity[i]["phone"],
#                   price: rand(0..100))
#   i += 1
#   puts "done #{i}object"
# end
Activity.destroy_all

url = "https://api.seatgeek.com/2/events?per_page=25&client_id=Mjg5MTM0MTJ8MTY2MjQ4MjA0NS43Mzc3NjQx"
activity_serialized = URI.open(url).read
activity = JSON.parse(activity_serialized)["events"]

# puts(activity[10])
puts "Starting the seed"
i = 0
for i in 0..24 do
  Activity.create(summary: activity[i]["title"],
                  name: activity[i]["venue"]["name"],
                  address: activity[i]["venue"]["address"],
                  contact_info: activity[i]["id"],
                  image: activity[i]["performers"][0]["image"],
                  price: rand(0..100))
  i += 1
  puts "done! #{i - 1}object is now seeded"
end

# url = "https://api.seatgeek.com/2/events?client_id=Mjg5MTM0MTJ8MTY2MjQ4MjA0NS43Mzc3NjQx"
# activity_serialized = URI.open(url).read
# activity = JSON.parse(activity_serialized)

# puts "Starting the seed"
# i = 1
# for i in 1..15 do
#   Activity.create(summary: activity[i]["events"]["type"])
#                   # name: activity[i]["name_v2"])
#                   # address: [activity[i]["street"], activity[i]["city"]],
#                   # contact_info: activity[i]["phone"],
#                   # price: rand(0..100))
#   i += 1
#   puts "done! #{i - 1}object is now seeded"
# end
