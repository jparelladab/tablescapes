user1 = User.create first_name: "Melissa", last_name: "Harrington", email: "melissaharrington77@gmail.com", password: "Password77"
puts ""
puts "EMAIL: 'melissaharrington77@gmail.com', PASSWORD: 'Password77'"
puts ""

puts "GENERATING ADDRESSES.............."
raw_addresses = File.readlines('db/resources/example-addresses.txt')
addresses = []
raw_addresses.each do |address|
  addresses << address.gsub(/\n/, "")
end
puts ""
puts "ADDRESSES:"
pp addresses
puts ""

puts "SEEDING USERS.............."
users = []
40.times {
  user = User.create email: Faker::Internet.email, password: Faker::Internet.password, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name
  users << user
}
puts ""
puts "USERS CREATED:"
pp User.all
puts ""

puts "SOURCING PHOTO URLS.............."
photo = Unsplash::Photo.find("tAKXap853rY")
photos1 = Unsplash::Photo.search("table setting")
photos2 = Unsplash::Photo.search("tableware")
photos3 = Unsplash::Photo.search("table linen")
photos4 = Unsplash::Photo.search("dinner setting")
photos5 = Unsplash::Photo.search("table set")
photos6 = Unsplash::Photo.search("dining table set")
photos_all = photos1 + photos2 + photos3 + photos4 + photos5 + photos6
photo_urls = []
photos_all.each {|photo| photo_urls << photo[:urls][:regular]}
puts ""
puts "PHOTO URLS:"
pp photo_urls
puts ""

puts "GENERATING TAGS.............."
raw_tags = File.readlines('db/resources/tags.txt')
tags = []
raw_tags.each do |tag|
  tags << tag.gsub(/\n/, "")
end
puts ""
puts "TAGS:"
pp tags
puts ""

puts "SEEDING TABLESCAPES.............."
counter = 0
tablescapes = []
50.times {
  tablescape = Tablescape.create(name: (Faker::Color.color_name.capitalize + " " + Faker::Commerce.material.capitalize), price_per_person: rand(25..250), description: Faker::Lorem.paragraph(sentence_count: 3), user: users[rand(0..(users.count - 1))], tag: tags[rand(0..(tags.count - 1))], location: addresses[rand(0..(addresses.count - 1))], image: photo_urls[counter])
  tablescapes << tablescape
  counter = (counter + 1)
}
puts ""
puts "TABLESCAPES CREATED:"
pp Tablescape.all
puts ""

puts "SEEDING BOOKINGS.............."
80.times {
  Booking.create user: users[rand(0..(users.count - 1))], tablescape: tablescapes[rand(0..(tablescapes.count - 1))], date_from: Faker::Date.backward(days: 180), date_to: Faker::Date.forward(days: 180), total_price: rand(125..500), attendees: rand(5..20)
}
puts ""
puts "BOOKINGS CREATED:"
pp Booking.all
puts ""

puts "GENERATING ITEMS.............."
raw_items = File.readlines('db/resources/items.txt')
items = []
raw_items.each do |item|
  items << item.gsub(/\n/, "")
end
puts ""
puts "ITEMS:"
pp items
puts ""

puts "SEEDING ITEMS.............."
240.times {
  Item.create name: items[rand(0..(items.count - 1))], description: Faker::Lorem.paragraph(sentence_count: 3), category: Faker::Appliance.equipment, tablescape: tablescapes[rand(0..(tablescapes.count - 1))]
}
puts ""
puts "ITEMS CREATED:"
pp Item.all
puts ""
