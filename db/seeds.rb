user1 = User.create email: "test@test.com", password: "123456"

puts "email: 'test@test.com', password: '123456'"

users = []
40.times {
  user = User.create email: Faker::Internet.email, password: Faker::Internet.password, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
  users << user
}

photo = Unsplash::Photo.find("tAKXap853rY")
photos1 = Unsplash::Photo.search("table setting")
photos2 = Unsplash::Photo.search("tableware")
photos3 = photos1 + photos2
photo_urls = []
photos3.each {|photo| photo_urls << photo[:urls][:small]}

counter = 0
tablescapes = []
20.times {
  tablescape = Tablescape.create(name: (Faker::Color.color_name.capitalize + " " + Faker::Commerce.material.capitalize), price_per_person: rand(25..250), description: Faker::Lorem.paragraph(sentence_count: 3), user: users[rand(0..(users.count - 1))], tag: Faker::Cosmere.shard, location: Faker::Address.city, image: photo_urls[counter])
  tablescapes << tablescape
  counter = (counter + 1)
}

80.times {
  Booking.create user: users[rand(0..(users.count - 1))], tablescape: tablescapes[rand(0..(tablescapes.count - 1))], date_from: Faker::Date.backward(days: 180), date_to: Faker::Date.forward(days: 180), total_price: rand(125..500), attendees: rand(5..20)
}

240.times {
  Item.create name: Faker::Appliance.brand, description: Faker::Lorem.paragraph(sentence_count: 3), category: Faker::Appliance.equipment, tablescape: tablescapes[rand(0..(tablescapes.count - 1))]
}

puts "USERS CREATED:"
pp User.all

puts "TABLESCAPES CREATED:"
pp Tablescape.all

puts "BOOKINGS CREATED"
pp Booking.all

puts "ITEMS CREATED:"
pp Item.all
