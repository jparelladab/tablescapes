user1 = User.create email: "test@test.com", password: "123456"

puts "email: 'test@test.com', password: '123456'"

users = []
100.times {
  user = User.create email: Faker::Internet.email, password: Faker::Internet.password, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
  users << user
}

tablescapes = []
50.times {
  tablescape = Tablescape.create(name: (Faker::Color.color_name.capitalize + " " + Faker::Commerce.material.capitalize), price_per_person: rand(25..250), description: Faker::Quote.matz, user: users[rand(0..(users.count - 1))], tag: Faker::Cosmere.shard, location: Faker::Address.city)
  tablescapes << tablescape
}

200.times {
  Booking.create user: users[rand(0..(users.count - 1))], tablescape: tablescapes[rand(0..(tablescapes.count - 1))], date_from: Faker::Date.backward(days: 180), date_to: Faker::Date.forward(days: 180), total_price: rand(125..500), attendees: rand(5..20)
}

800.times {
  Item.create name: Faker::Appliance.brand, description: Faker::Quote.matz, category: Faker::Appliance.equipment, tablescape: tablescapes[rand(0..(tablescapes.count - 1))]
}

puts "USERS CREATED:"
pp User.all

puts "TABLESCAPES CREATED:"
pp Tablescape.all

puts "BOOKINGS CREATED"
pp Booking.all

puts "ITEMS CREATED:"
pp Item.all

