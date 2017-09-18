# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pizza = Category.create(name: 'Pizza')
pasta = Category.create(name: 'Pasta')

cheese_pizza = pizza.items.create(name: 'Cheese Pizza', code: 'CPZ')
pepperoni_pizza = pizza.items.create(name: 'Pepperoni Pizza', code: 'PPZ')
spaghetti_meatballs = pasta.items.create(name: 'Spaghetti and Meatballs', code: 'SMB')

mozzerella = Ingredient.create(name: 'cheese', code: 'MZ')
parmesian = Ingredient.create(name: 'parmesian', code: 'PR')
pizza_sauce = Ingredient.create(name: 'pizza_sauce', code: 'PS')
marinara_sauce = Ingredient.create(name: 'marinara sauce', code: 'MS')
pepperoni = Ingredient.create(name: 'pepperoni', code: 'PP')
meatballs = Ingredient.create(name: 'meatballs', code: 'MB')

cheese_pizza.includes.create(ingredient: mozzerella)
cheese_pizza.includes.create(ingredient: pizza_sauce)
pepperoni_pizza.includes.create(ingredient: mozzerella)
pepperoni_pizza.includes.create(ingredient: pizza_sauce)
pepperoni_pizza.includes.create(ingredient: pepperoni)
spaghetti_meatballs.includes.create(ingredient: marinara_sauce)
spaghetti_meatballs.includes.create(ingredient: meatballs)
