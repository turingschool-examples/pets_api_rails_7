# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Clear existing pets to avoid duplicates
Pet.destroy_all

# Array of common pet types
pet_types = ['Dog', 'Cat', 'Bird', 'Fish', 'Hamster', 'Rabbit', 'Guinea Pig', 'Turtle', 'Snake', 'Lizard']

# Create 50 pets
50.times do
  Pet.create!(
    name: Faker::Creature::Dog.name,
    animal_type: pet_types.sample,
    age: rand(1..15)
  )
end

puts "Created #{Pet.count} pets!"
