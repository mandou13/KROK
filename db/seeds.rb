# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
puts "#{User.count} users"
puts "#{Rating.count} users"
puts "#{LikedRecipe.count} users"
puts "#{Planner.count} users"
puts "#{Recipe.count} users"
puts "#{PlannerRecipe.count} users"
puts "#{ShoppingList.count} users"
puts "#{Ingredient.count} users"

puts "DELETING"
User.destroy_all
Rating.destroy_all
LikedRecipeLiked.destroy_all
Planner.destroy_all
Recipe.destroy_all
PlannerRecipe.destroy_all
ShoppingList.destroy_all
Ingredient.destroy_all

puts "#{User.count} users"
puts "#{Rating.count} users"
puts "#{LikedRecipe.count} users"
puts "#{Planner.count} users"
puts "#{Recipe.count} users"
puts "#{PlannerRecipe.count} users"
puts "#{ShoppingList.count} users"
puts "#{Ingredient.count} users"


puts "SEEDING"


User.destroy_all
Rating.destroy_all
LikedRecipe.destroy_all
Planner.destroy_all
Recipe.destroy_all
PlannerRecipe.destroy_all
ShoppingList.destroy_all
Ingredient.destroy_all


amandine = User.new(
  username: "Mandou",
  password: "azerty",
  email: "amandine.legal@me.com")
photo_a = URI.open('https://avatars3.githubusercontent.com/u/58696274?v=4')
amandine.photo.attach(io: photo_a, filename: 'photogithub.png', content_type: 'image/png')
amandine.save

maxence = User.new(
  username: "Naicma59",
  password: "azerty",
  email: "maxence@me.com")
photo_m = URI.open('https://avatars3.githubusercontent.com/u/58698893?v=4')
maxence.photo.attach(io: photo_m, filename: 'photogithub.png', content_type: 'image/png')
maxence.save

louis = User.new(
  username: "Gat_food_lover",
  password: "azerty",
  email: "gat@me.com")

photo = URI.open('https://avatars2.githubusercontent.com/u/56741514?v=4')
louis.photo.attach(io: photo, filename: "photogithub.png", content_type: 'image/png')
louis.save

pauline = User.new(
  username: "Paopao",
  password: "azerty",
  email: "pauline@me.com")
photo_p = URI.open("https://avatars1.githubusercontent.com/u/58698738?v=4")
pauline.photo.attach(io: photo_p, filename: "photogithub.png", content_type: "image/png")
pauline.save

user_id = []
User.all.each do |user|
  user_id << user.id
end

first_recipe = Car.new(
  name:        "Blanquette de Veau",
  description: "Du veau, des poireaux, des carottes, des champignons et une garniture aromatique.",
  dish_type:   "Main",
  dish_origin: "French",
  prep_time:   30,
  servings:    2,
  user_id:     user_id.sample,
  )




