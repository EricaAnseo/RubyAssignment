# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Erica Chai",
             email: "20063209@mail.wit.ie",
             password:              "password",
             password_confirmation: "password", 
             admin: true)

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@sample.org"
  password = "password"
  address = Faker::Address.street_address + Faker::Address.street_name + Faker::Address.city + Faker::Address.country
  avatar = Faker::Avatar.image 
  User.create!(name:  name,
               email: email,
               address: address,
               password:              password,
               password_confirmation: password)
end

15.times do |c|
  prodname = Faker::Commerce.product_name
  price = Faker::Commerce.price
  user = User.find(c+1)
  user.products.create!(prodname: prodname, 
                        description:"N/A",
                        price: price, 
                        ship_cost: c+0.99, 
                        stock: c+10)
end

# Create some users
User.create(name:'joe bloggs', email:'jb@here.com', address: '123 Address goes here', password: "secret", password_confirmation: "secret")
User.create(name:'Megan Cloggs', email:'jc@here.com', address: 'ABC Address goes here', password: "secret", password_confirmation: "secret")
User.create(name:'jim smith', email:'js@here.com', address: 'aosjd Address goes here',password: "secret", password_confirmation: "secret")

# Associate some microposts with users
user = User.find(1)
user.products.create(prodname: '7up', 
	description:'a brand of lemon-lime flavored, non-caffeinated soft drink. The rights to the brand are held by Dr Pepper Snapple Group in the United States, and PepsiCo (or its licensees) in the rest of the world.',
	price: "1.24", ship_cost: "0.05", stock: "312")
user.products.create(prodname: "Coke", 
	description:"the most popular and biggest-selling soft drink in history, as well as one of the most recognizable brands in the world. Created in 1886 in Atlanta, Georgia, by Dr. John S. Pemberton, Coca-Cola was first offered as a fountain beverage at Jacob's Pharmacy by mixing Coca-Colasyrup with carbonated water.",
	price: 1.20, ship_cost: 0.05, stock: 336)
user = User.find(2)
user.products.create(prodname: "Glen Glam - Crewneck Boxy T-Shirt", 
	description:"A boxy bodice balances the elbow-length, roomy sleeves on this crewneck tee. Team with a jumper skirt or pants!",
	price: 9.81, ship_cost: 2.50, stock: 15)
user = User.find(3)
user.products.create(prodname: "Melon Juice - Plain 3/4 Sleeve T-Shirt", 
	description:"N/A",
	price: 11.31, ship_cost: 3, stock: 24)

# Create category
clothes = Category.create(category_name: 'Clothes', category_desc: 'Brand new or second hand clothes')
accessories = Category.create(category_name: 'Accessories', category_desc: 'Ranging from computer accessories to clothes accessories')
food = Category.create(category_name: 'Food', category_desc: 'Editable items ranging from drinks to sweets')
film = Category.create(category_name: 'Film', category_desc: 'Brand new or second hand movies')
gaming = Category.create(category_name: 'Gaming', category_desc: 'Games for the xbox, playstation, wii, or computer')
other = Category.create(category_name: 'Other', category_desc: 'Anything that doesnt fit in the other categories')

# Associate some categories with products
Product.find(1).categories << food
Product.find(2).categories << food
Product.find(3).categories << clothes
Product.find(4).categories << clothes << accessories


