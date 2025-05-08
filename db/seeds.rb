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
Event.destroy_all
Community.destroy_all

puts "Creating roles..."
[ 'Admin', 'Moderator', 'Member' ].each do |role_name|
  Role.find_or_create_by!(name: role_name)
end

puts "Creating users... 🎉"
User.create!(
    email_address: "user@gmail.com",
    username: "Master",
    password: 'q1w2e3r4',
    password_confirmation: 'q1w2e3r4',
    role_id: Role.find_by(name: 'Admin').id
  )

  puts "Creating community members... 🎉"

  # Ensure all users are members of at least one community
  User.all.each do |user|
    # Each user joins between 1-5 random communities
    communities = Community.all.sample(rand(1..5))
    communities.each do |community|
      CommunityMember.create!(
        user: user,
        community: community,
        joined_at: Faker::Time.between(from: 1.year.ago, to: Date.today)
      )
    end
  end

99.times do
  User.create!(
    email_address: Faker::Internet.unique.email,
    username: Faker::Internet.unique.username,
    password: 'q1w2e3r4',
    password_confirmation: 'q1w2e3r4',
    role_id: Role.find_by(name: 'Member').id
  )
end

puts "Creating Community... 🎉"
15.times do
  Community.create!(
    name: Faker::Company.unique.name+" Community",
    descriptions: Faker::Lorem.paragraph(sentence_count: 3)
  )
end

puts "Creating events... 🎉"
Community.all.each do |community|
  rand(1..4).times do
    Event.create!(
      name: Faker::Lorem.sentence(word_count: 3)+" Event",
      date: Faker::Date.between(from: 3.months.ago, to: Date.today),
      community: community
    )
  end
end

puts "Seed completed successfully!"
