# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
puts "#{User.count} users"
puts "#{Rating.count} ratings"
puts "#{LikedRecipe.count} liked_recipe"
puts "#{Planner.count} planner"
puts "#{Recipe.count} recipe"
puts "#{PlannerRecipe.count} planner_recipe"
puts "#{ShoppingList.count} shopping_list"
puts "#{Ingredient.count} ingredient"

puts "DELETING"

Rating.destroy_all
LikedRecipe.destroy_all
Planner.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
PlannerRecipe.destroy_all
ShoppingList.destroy_all
User.destroy_all

puts "#{User.count} users"
puts "#{Rating.count} ratings"
puts "#{LikedRecipe.count} liked_recipe"
puts "#{Planner.count} planner"
puts "#{Recipe.count} recipe"
puts "#{PlannerRecipe.count} planner_recipe"
puts "#{ShoppingList.count} shopping_list"
puts "#{Ingredient.count} ingredient"


puts "SEEDING"

cyril = User.create!(
  username: "Cyril Lignac",
  password: "azerty",
  email:    "cyril@me.com",
)

photo_c = URI.open('https://www.parisinfo.com/var/otcp/sites/images/node_43/node_51/node_532/chef-%C3%A9toil%C3%A9-cyril-lignac-%7C-630x405-%7C-%C2%A9-arthur-delloye/12145594-1-fre-FR/Chef-%C3%A9toil%C3%A9-Cyril-Lignac-%7C-630x405-%7C-%C2%A9-Arthur-Delloye.gif')
cyril.photo.attach(io: photo_c, filename: 'photocyril.png', content_type: 'image/png')
cyril.save!

maxence = User.create!(
  username: "Naicma59",
  password: "azerty",
  email:    "maxence@me.com",
)

photo_m = URI.open('https://avatars3.githubusercontent.com/u/58698893?v=4')
maxence.photo.attach(io: photo_m, filename: 'photogithub.png', content_type: 'image/png')
maxence.save!

louis = User.create!(
  username: "Gat_food_lover",
  password: "azerty",
  email:    "gat@me.com",
)

photo = URI.open('https://avatars2.githubusercontent.com/u/56741514?v=4')
louis.photo.attach(io: photo, filename: "photogithub.png", content_type: 'image/png')
louis.save!

pauline = User.create!(
  username: "Paopao",
  password: "azerty",
  email:    "pauline@me.com",
)

photo_p = URI.open("https://avatars1.githubusercontent.com/u/58698738?v=4")
pauline.photo.attach(io: photo_p, filename: "photogithub.png", content_type: "image/png")
pauline.save

recipes = [
  {
    name:        "Veal Blanquette",
    description: "From Gordon Ramsay, a blanquette is a stew made with pale-coloured meats which are not fried first",
    steps:       "1_ Pour the stock and wine into a large saucepan, then add all the vegetables except the mushrooms. Add the garlic and rosemary and bring to the boil, then simmer, uncovered, for 10 mins.
                  2_ Trim veal of any excess fat and cut into large bite-size cubes. Add to pan with the mushrooms. Return to a simmer, season well, then cook for 20 mins until meat is just tender; allow longer if it’s not. The stew can be cooled and chilled or frozen at this stage.
                  3_ When ready to serve, beat together the yolks and cream. Return the stew to a simmer, stir in the horseradish or mustard, briskly mix in yolks and cream, then stir until it starts to thicken slightly. Take care not to overheat or the mixture will curdle. Stir in the butter, remove pan from the heat, then mix in the parsley, lemon zest and juice. Check the seasoning again.
                  4_ Meanwhile, boil tagliatelle according to pack instructions – about 3 mins for fresh pasta, up to 10 mins for dried. Drain and toss with a little butter. Make into a ‘barrel’ of pasta (see above right) or simply divide between six warmed plates. Spoon the Blanquette of veal on top and serve.
                  5_ Make a 'barrel' of tagliatelle Gordon's way: Pick up a few strands of pasta, digging a carving fork into the pot 3-4 times. Lift up the pasta so the strands hang free and press against the side of the pan. Then, holding with your (clean) fingers, start to twist the pasta into a barrel shape, pushing back against the pan side once or twice to neaten. When all the strands are wound, up-end the fork intothe centre of a plate and gently push the pasta off.",
    dish_type:   "Main Course",
    dish_origin: "French",
    difficulty:  "Medium",
    prep_time:   30,
    servings:    6,
    user_id:     cyril.id
  }
]

first_recipe = Recipe.create(recipes[0])

photo_first_recipe = URI.open("https://assets.afcdn.com/recipe/20190529/93189_w1024h768c1cx2886cy4330.jpg")
first_recipe.photo.attach(io: photo_first_recipe, filename: "photo_blanquette.png", content_type: "image/png")
first_recipe.save!

LikedRecipe.create(user_id: pauline.id, recipe_id: first_recipe.id)


Ingredient.create(name: 'Veal', unit: 'kg', quantity: 1, recipe_id: first_recipe.id)
Ingredient.create(name: 'White Wine', unit: 'ml', quantity: 250, recipe_id: first_recipe.id)
Ingredient.create(name: 'Leeks', quantity: 2, recipe_id: first_recipe.id)
Ingredient.create(name: 'Tagliatelle', unit: 'g', quantity: 300, recipe_id: first_recipe.id)
Ingredient.create(name: 'Carrot', quantity: 3, recipe_id: first_recipe.id)

Planner.create(
  name: Time.now.strftime("%D"),
  user_id: maxence.id
)

Planner.create(
  name: Time.now.strftime("%D"),
  user_id: louis.id
)

Planner.create(
  name: Time.now.strftime("%D"),
  user_id: pauline.id
)

PlannerRecipe.create(
  recipe_id: first_recipe.id,
  planner_id: louis.planners.last.id,
  servings: first_recipe.servings,
  cooked: false
  )

PlannerRecipe.create(
  recipe_id: first_recipe.id,
  planner_id: louis.planners.last.id,
  servings: first_recipe.servings,
  cooked: false
  )

PlannerRecipe.create(
  recipe_id: first_recipe.id,
  planner_id: pauline.planners.last.id,
  servings: first_recipe.servings,
  cooked: false
  )

PlannerRecipe.create(
  recipe_id: first_recipe.id,
  planner_id: pauline.planners.last.id,
  servings: first_recipe.servings,
  cooked: false
  )

PlannerRecipe.create(
  recipe_id: first_recipe.id,
  planner_id: maxence.planners.last.id,
  servings: first_recipe.servings,
  cooked: false
  )

PlannerRecipe.create(
  recipe_id: first_recipe.id,
  planner_id: maxence.planners.last.id,
  servings: first_recipe.servings,
  cooked: false
  )


puts "#{User.count} users"
puts "#{Rating.count} rating"
puts "#{LikedRecipe.count} liked_recipe"
puts "#{Planner.count} planner"
puts "#{Recipe.count} recipe"
puts "#{PlannerRecipe.count} planner_recipe"
puts "#{ShoppingList.count} shopping_list"
puts "#{Ingredient.count} ingredient"
