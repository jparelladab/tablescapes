# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all


user = User.create email: "test@test.com", password: "123456"

puts user

puts "EMAIL: test@test.com"
puts "PASS: 123456"

Tablescape.destroy_all

Tablescape.create(name: "white christmas", price_per_person: 40, user: user, description: "Very nice tablescape", tag: "christmas", location: "london")



# t.string "name"
#     t.integer "price_per_person"
#     t.text "description"
#     t.bigint "user_id"
#     t.string "tag"
#     t.string "location"
