# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Activity.create(summary: Faker::Fantasy::Tolkien.poem,
              name: Faker::Game.title,
              address: Faker::Address.full_address,
              contact_info: Faker::PhoneNumber,
              price: rand(50..200))
end
