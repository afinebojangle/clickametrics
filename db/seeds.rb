require 'faker'

5.times do
  user = User.new(
    email:  Faker::Internet.email,
    password:  Faker::Lorem.characters(10))
  user.save!
end

users = User.all

50.times do
  Website.create!(
    user:  users.sample,
    url:  Faker::Internet.url
    )
end

websites = Website.all

100.times do
  website = websites.sample
  Event.create!(
    website_id:  website.id,
    name:  Faker::Lorem.word
    )
end

user = User.first
user.update_attributes!(
  email: 'admin@example.com',
  password: 'helloworld'
  )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Website.count} websites created"
puts "#{Event.count} events created"
