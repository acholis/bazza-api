# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rails generate scaffold_controller api/v1/pets

user = User.create(
    email: 'manucabanga@gmail.com',
    cell_phone: '923747220',
    password: 'q1w2e3r4', 
    password_confirmation: 'q1w2e3r4'
)

p user