# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
puts 'Cleaning database...'
User.destroy_all
Food.destroy_all

foods = JSON.parse(File.read('data/food.json'), symbolize_names: true)

puts 'Creating foods...'
foods.each do |food|
    Food.create!(
        name: food[:name],
        description: food[:description],
        price: food[:price],
    )
    image = URI.open(food[:image])
    Food.last.image.attach(io: image, filename: 'food.jpg', content_type: 'image/jpg')
end
puts 'Finished!'
