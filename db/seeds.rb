# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# User
puts "Creating one user..."
first_user = User.create({
  :email => 'hung.dao@mail.com',
  :name => "Hung Dao",
  :password => "123456"
})

# Task
puts "Creating tasks..."
tasks = Task.create([
  {:user_id => first_user.id, :description => "Have to do task 1"},
  {:user_id => first_user.id, :description => "Have to do task 2"}
])

