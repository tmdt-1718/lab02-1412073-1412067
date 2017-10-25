# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Message.destroy_all
user1 = User.create!(name: Faker::Name.name, email: 'cuongkb1g', password: 'cuongkb3g')
user2 = User.create!(name: Faker::Name.name, email: 'cuongkb2g', password: 'cuongkb3g')
user3 = User.create!(name: Faker::Name.name, email: 'cuongkb3g', password: 'cuongkb3g')

message = user1.messages.create!(receiver: user2.id, text: user1.name)
message = user1.messages.create!(receiver: user3.id, text: user1.name)
message = user2.messages.create!(receiver: user1.id, text: user2.name)
message = user2.messages.create!(receiver: user3.id, text: user2.name)
message = user3.messages.create!(receiver: user1.id, text: user3.name)
message = user3.messages.create!(receiver: user2.id, text: user3.name)
