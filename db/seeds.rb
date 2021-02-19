# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Flat.destroy_all

puts "Creating flats"

10.times do
  flat = Flat.new(
    name: Faker::Marketing.buzzwords,
    address: Faker::Address.full_address,
    description: Faker::Lorem.sentence(word_count: 12, supplemental: true),
    price_per_night: Faker::Number.within(range: 75..300),
    number_of_guests: Faker::Number.within(range: 2..10)
  )
  flat.save!
  puts "#{flat.name}, $#{flat.price_per_night} per night"
end
puts "there are #{Flat.count} flats"
