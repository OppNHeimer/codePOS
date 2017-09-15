# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cheese_pizza = Item.create(name: 'cheese pizza', code: 'cpz', category: 'pizza')
pepperoni_pizza = Item.create(name: 'pepperoni pizza', code: 'ppz', category: 'pizza')

cheese = Food.create(name: 'cheese', code: 'ch')
pizza_sauce = Food.create(name: 'pizza_sauce', code: 'ps')
pepperoni = Food.create(name: 'pepperoni', code: 'pp')

cheese_pizza.ingredients.create(food: cheese)
cheese_pizza.ingredients.create(food: pizza_sauce)
pepperoni_pizza.ingredients.create(food: cheese)
pepperoni_pizza.ingredients.create(food: pizza_sauce)
pepperoni_pizza.ingredients.create(food: pepperoni)
