# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
    [ Faker::Name.name, Faker::Internet.email, 'admin123' ],
    [ Faker::Name.name, Faker::Internet.email, 'admin123' ],
    [ Faker::Name.name, Faker::Internet.email, 'admin123' ],
    [ Faker::Name.name, Faker::Internet.email, 'admin123' ],
    [ Faker::Name.name, Faker::Internet.email, 'admin123' ],
    [ Faker::Name.name, Faker::Internet.email, 'admin123' ],
    [ Faker::Name.name, Faker::Internet.email, 'admin123' ],
    [ Faker::Name.name, Faker::Internet.email, 'admin123' ],
    [ Faker::Name.name, Faker::Internet.email, 'admin123' ]
]

user_list.each do |name, email, password|
    User.create(name: name, email:email, password: password)
end
