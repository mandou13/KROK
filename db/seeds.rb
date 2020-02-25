# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroy"
Recipe.destroy_all
User.destroy_all

users = [
  {
    email: "pauline@me.com",
    password: "azerty"
  }
]

puts "create users"
users.each do |user|
  User.create!(user)
end
puts "#{User.count} users"

recipes = [
  {
    name: "Apple Pie d'Automne",
    description: "Préchauffer le four à 200°C (thermostat 6-7).",
    dish_type: "Dessert",
    dish_origin: "French",
    prep_time: "50 minutes",
    servings: 6
  }
]

puts "create recipes"
recipes.each do |recipe|
  new_recipe = Recipe.new(recipe)
  new_recipe.user = User.first
  new_recipe.save!
end
puts "#{Recipe.count} recipes"
