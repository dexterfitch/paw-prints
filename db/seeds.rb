# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Example = User.create([{ avatar: '../public/system/users/avatars/000/000/001/medium/kitten_with_mittens.jpg',
                         name: 'Mittens',
                         email: 'mittens@example.com',
                         password: '1234'
                         password_confirmation: '1234' }])
