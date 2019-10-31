# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, 
#                          { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user = User.create!(
    email: "admin@admin",
    password: "123456"
)

Category.destroy_all

category = Category.create!(
    category: "Sailor Moon"
)

Product.destroy_all

Product.create!(
    title: "Sailor Moon - Sailor Venus S.H.Figuarts 5.5” Action Figure",
    description: "A great product",
    price: 89.99,
    user: user,
    quantity: 5,
    category: category,
)
