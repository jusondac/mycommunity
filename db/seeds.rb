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

# Clear existing data
Role.destroy_all
User.destroy_all
Community.destroy_all

puts "Creating roles..."
[ 'Admin', 'Moderator', 'Member' ].each do |role_name|
  Role.find_or_create_by!(name: role_name)
end

puts "Creating users..."
User.create!(
    email_address: "master@gmail.com",
    username: "Master",
    password: 'q1w2e3r4',
    password_confirmation: 'q1w2e3r4',
    role_id: Role.find_by(name: 'Member').id
  )

5.times do
  User.create!(
    email_address: Faker::Internet.unique.email,
    username: Faker::Internet.unique.username,
    password: 'q1w2e3r4',
    password_confirmation: 'q1w2e3r4',
    role_id: Role.find_by(name: 'Member').id
  )
end

puts "Creating communities..."
10.times do
  Community.create!(
    name: Faker::Company.unique.name,
    descriptions: Faker::Lorem.paragraph(sentence_count: 3)
  )
end

puts "Seed completed successfully!"
