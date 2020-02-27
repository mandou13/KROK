require 'csv'
require "open-uri"

#SCRAPPING  BBC GOOD FOOD
# require 'nokogiri'
# require 'open-uri'
# require 'csv'

# URL_BBC = 'https://www.bbcgoodfood.com/'
# DISH_TYPE = ['Dessert', 'Starter', 'Appetizer', 'Main Course', 'Side', 'Snack']

# csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
# filepath    = 'recipes.csv'


# def scrapping(meal_type, meal_origin)
#   url_search = URL_BBC + 'search/recipes?query='  + meal_type + ' ' +meal_origin
#   doc = Nokogiri::HTML(open(url_search), nil, 'utf-8')
#   names = scrapping_search(doc, ".teaser-item__title")
#   prep_times = cooking_time(scrapping_search(doc, ".teaser-item__info-item--total-time"))
#   difficulty = scrapping_search(doc, ".teaser-item__info-item--skill-level")
#   description =  scrapping_search(doc, '.even')
#   url_meals =  scrapping_h3_href(doc, 'teaser-items')
#   names.each_with_index do |recipe, index|
#     recipe_page = Nokogiri::HTML(open(url_meals[index]), nil, 'utf-8')
#     servings = recipe_page.at("//span[@itemprop = 'recipeYield']").children.text.scan(/\d/)[0]
#     steps = scrapping_search(recipe_page, ".method__list")
#     photo_recipe = URI.open(recipe_page.xpath("//img[@itemprop = 'image']").map { |t| t[:src].remove(/\/{2}/) }[index])
#     uu_id = SecureRandom(10)
#     CSV.open(filepath, 'wb', csv_options) do |csv|
#       csv << ['Name', 'steps', 'Meal type', 'Origin']
#       csv << [names[index], steps, meal_type, meal_origin, prep_times[index], servings, description, difficulty[index]]
#     end
#     recipe = Recipe.new(
#       name: names[index],
#       steps: steps,
#       dish_type: meal_type,
#       dish_origin: meal_origin,
#       prep_time: prep_times[index],
#       servings: servings,
#       description: description,
#       difficulty: difficulty[index],
#     )

#     recipe.photo.attach(io: photo_recipe, filename: "photo#{names[index]}.png", content_type: "image/png")
#     p photo_recipes
#     ingredients = scrapping_search(recipe_page, ".ingredients-list__item").each do |ingredient|
#       quantity = ingredient.split(" ")[0].scan(/\d/).join.to_i
#       unit = ingredient.split(" ")[0].scan(/\D/).join
#       unit = 'tbsp' if unit == ""
#       ingredient = Ingredient.new(
#       recipe_id: recipe.id,
#       quantity: quantity,
#       unit: unit,
#       name: ingredient.split(" ").drop(1).join(" "),
#       )
#       CSV.open(filepath, 'wb', csv_options) do |csv|
#         csv << [quantity, unit, ingredient.split(" ").drop(1).join(" ")]
#        end
#       # p ingredient
#     end
#   end
# end
# scrapping('dessert', 'french')


# def scrapping_search(doc, tag)
#   array = []
#   doc.search(tag).each { |recipe| array << recipe.text.strip }
#   array
# end


# def scrapping_h3_href(doc, tag)
#   doc.xpath('//h3[@class="teaser-item__title"]/a/@href').map { |recipe| URL_BBC + recipe.value }
#   # doc.search(tag).map { |recipe| recipe.value }
# end

# def cooking_time(cooking_time_array)
#   cooking_time_array.map do |time|
#     if time.include?("hour") || time.include?("hours")
#       time = time.split(" ")
#       hours = time[0].to_i * 60
#       minutes = time.drop(1).join(" ").scan(/\d/).join('').to_i
#       time = minutes + hours
#     else
#       time = time.split(" ")
#       time = time[0].to_i
#     end
#   time
#   end
# end


# names = scrapping_search(doc, ".teaser-item__title")
# names.each_with_index do |recipe, index|
#   recipe_page = Nokogiri::HTML(open(url_meals[index]), nil, 'utf-8')
#   p recipe_page.xpath("//img[@itemprop = 'image']").map { |t| t[:src].remove(/\/{2}/) }
# end


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

# maxence = User.create!(
#   username: "Naicma59",
#   password: "azerty",
#   email:    "maxence@me.com",
# )

# photo_m = URI.open('https://avatars3.githubusercontent.com/u/58698893?v=4')
# maxence.photo.attach(io: photo_m, filename: 'photogithub.png', content_type: 'image/png')
# maxence.save!

# louis = User.create!(
#   username: "Gat_food_lover",
#   password: "azerty",
#   email:    "gat@me.com",
# )

# photo = URI.open('https://avatars2.githubusercontent.com/u/56741514?v=4')
# louis.photo.attach(io: photo, filename: "photogithub.png", content_type: 'image/png')
# louis.save!

# pauline = User.create!(
#   username: "Paopao",
#   password: "azerty",
#   email:    "pauline@me.com",
# )

# photo_p = URI.open("https://avatars1.githubusercontent.com/u/58698738?v=4")
# pauline.photo.attach(io: photo_p, filename: "photogithub.png", content_type: "image/png")
# pauline.save

# first_recipe = Recipe.create!(
#   name:        "Veal Blanquette",
#   description: "From Gordon Ramsay, a blanquette is a stew made with pale-coloured meats which are not fried first",
#   steps:       "1_ Pour the stock and wine into a large saucepan, then add all the vegetables except the mushrooms. Add the garlic and rosemary and bring to the boil, then simmer, uncovered, for 10 mins.
#                 2_ Trim veal of any excess fat and cut into large bite-size cubes. Add to pan with the mushrooms. Return to a simmer, season well, then cook for 20 mins until meat is just tender; allow longer if it’s not. The stew can be cooled and chilled or frozen at this stage.
#                 3_ When ready to serve, beat together the yolks and cream. Return the stew to a simmer, stir in the horseradish or mustard, briskly mix in yolks and cream, then stir until it starts to thicken slightly. Take care not to overheat or the mixture will curdle. Stir in the butter, remove pan from the heat, then mix in the parsley, lemon zest and juice. Check the seasoning again.
#                 4_ Meanwhile, boil tagliatelle according to pack instructions – about 3 mins for fresh pasta, up to 10 mins for dried. Drain and toss with a little butter. Make into a ‘barrel’ of pasta (see above right) or simply divide between six warmed plates. Spoon the Blanquette of veal on top and serve.
#                 5_ Make a 'barrel' of tagliatelle Gordon's way: Pick up a few strands of pasta, digging a carving fork into the pot 3-4 times. Lift up the pasta so the strands hang free and press against the side of the pan. Then, holding with your (clean) fingers, start to twist the pasta into a barrel shape, pushing back against the pan side once or twice to neaten. When all the strands are wound, up-end the fork intothe centre of a plate and gently push the pasta off.",
#   dish_type:   "Main Course",
#   dish_origin: "French",
#   difficulty:  "Medium",
#   prep_time:   30,
#   servings:    6,
#   user_id:     cyril.id,
# )

# photo_first_recipe = URI.open("https://assets.afcdn.com/recipe/20190529/93189_w1024h768c1cx2886cy4330.jpg")
# first_recipe.photo.attach(io: photo_first_recipe, filename: "photo_blanquette.png", content_type: "image/png")
# first_recipe.save!

# Ingredient.create(name: 'Veal', unit: 'kg', quantity: 1, recipe_id: first_recipe.id)
# Ingredient.create(name: 'White Wine', unit: 'ml', quantity: 250, recipe_id: first_recipe.id)
# Ingredient.create(name: 'Leeks', quantity: 2, recipe_id: first_recipe.id)
# Ingredient.create(name: 'Tagliatelle', unit: 'g', quantity: 300, recipe_id: first_recipe.id)
# Ingredient.create(name: 'Carrot', quantity: 3, recipe_id: first_recipe.id)



# puts "#{User.count} users"
# puts "#{Rating.count} rating"
# puts "#{LikedRecipe.count} liked_recipe"
# puts "#{Planner.count} planner"
# puts "#{Recipe.count} recipe"
# puts "#{PlannerRecipe.count} planner_recipe"
# puts "#{ShoppingList.count} shopping_list"
# puts "#{Ingredient.count} ingredient"


csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }

CSV.foreach(Rails.root.join('db', 'datas', 'recipes.csv'), csv_options) do |row|
  recipe = Recipe.create!(
      name: row["name"],
      steps: row["steps"],
      dish_type: row["meal_type"],
      dish_origin: row["origin"],
      prep_time: row["prep_time"],
      servings: row["servings"],
      description: row["description"],
      difficulty: row["difficulty"],
      user_id: cyril.id
      )
  photo_recipe = URI.open('https://' + row["photo_url"])
  recipe.photo.attach(io: photo_recipe, filename: "photo_#{row["name"]}.png", content_type: 'image/png')
  recipe.save!
  uuid_recipe = row["uuid"]
  CSV.foreach(Rails.root.join('db', 'datas', 'ingredients.csv'), csv_options) do |row|
    if uuid_recipe == row["uuid"]
      ingredient = Ingredient.new(
        recipe_id: recipe.id,
        quantity: row["quantity"],
        unit: row["unit"],
        name: row["name"],
        )
    end
  end
end

