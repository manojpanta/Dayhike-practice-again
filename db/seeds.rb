# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(username:'manoj', email:'manoj', password:'manoj')

trip_1 = Trip.create(name:'denver public library')
trip_2 = Trip.create(name:'lakewood public library')
trip_3 = Trip.create(name:'this is not really aweso,me one')
trip_4 = Trip.create(name:'Nepal is awesome')
trip_5 = Trip.create(name:'This public library')

trail_7 = Trail.create(name:'this is a sample trail which is free today.')
trail_8 = Trail.create(name:'this is a sample trail which is free today.')
trail_9 = Trail.create(name:'this is a sample trail which is free today.')
trail_10 = Trail.create(name:'this is a sample trail which is free today.')
trail_11 = Trail.create(name:'this is a sample trail which is free today.')
