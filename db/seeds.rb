# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Helpers

def create_user(name, email, password)
  user = User.new(name: name, email: email, password: password)
  user.skip_confirmation!
  user.save!
end

###############################################################################

# Create Users

user1 = create_user(Faker::Name.name , Faker::Internet.email, 'helloworld')
user2 = create_user(Faker::Name.name , Faker::Internet.email, 'helloworld')
user3 = create_user(Faker::Name.name , Faker::Internet.email, 'helloworld')

# This user won't have any todo items
user4 = create_user(Faker::Name.name , Faker::Internet.email, 'helloworld')

###############################################################################

# Create Todo Items for each user

User.all[0..-2].each do |user|
  10.times do
    Item.create!(user: user, name: Faker::Lorem.sentence)
  end
end