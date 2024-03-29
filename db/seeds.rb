# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'chef_andrei@gmail.com', password: '123456', password_confirmation: '123456')
User.create!(email: 'chef_serban@gmail.com', password: '123456', password_confirmation: '123456')
User.create!(email: 'user_mihai@gmail.com', password: '123456', password_confirmation: '123456')
User.create!(email: 'user_ioana@gmail.com', password: '123456', password_confirmation: '123456')