# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create!(
    category: "Sailor Moon"
)

User.create!(
    email: "admin@admin",
    password: "123456"
)


Product.destroy_all

products = [
    title: "Sailor Moon - Sailor Venus S.H.Figuarts 5.5” Action Figure",
    description: "A great product",
    price: 89.99,
    user_id: 1,
    category_id: 1,
]
User.create(users)
Product.create!(products)