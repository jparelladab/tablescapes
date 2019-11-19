# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all


user_one = User.new email: "test@test.com", password: "123456"
user_one.save
user_two = User.new email: "test@test.com", password: "654321"
user_two.save

puts "EMAIL: test@test.com"
puts "PASS: 123456"

puts "Destroying the tablescapes"
Tablescape.destroy_all

puts "Creating seed tablescapes"

10.times do
  Tablescape.create(name: "Test Tablescape", price_per_person: "150", description: "A test description of Test Tablescape", user: user_one, tag: "Test", location: "London")
end
10.times do
  Tablescape.create(name: "Test Tablescape Two", price_per_person: "200", description: "A test description of Test Tablescape Two", user: user_two, tag: "Test Two", location: "London")
end

puts "Tablescapes created"
p Tablescape.all
