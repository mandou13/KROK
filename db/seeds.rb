# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#SCRAPPING  BBC GOOD FOOD
require 'nokogiri'
require 'open-uri'

URL_BBC = 'https://www.bbcgoodfood.com/'
DISH_TYPE = ['Dessert', 'Starter', 'Appetizer', 'Main Course', 'Side', 'Snack']


def scrapping(meal_type, meal_origin)
  url_search = URL_BBC + 'search/recipes?query='  + meal_type + ' ' +meal_origin
  doc = Nokogiri::HTML(open(url_search), nil, 'utf-8')
  names = scrapping_search(doc, ".teaser-item__title")
  prep_times = cooking_time(scrapping_search(doc, ".teaser-item__info-item--total-time"))
  difficulty = scrapping_search(doc, ".teaser-item__info-item--skill-level")
  description =  scrapping_search(doc, '.even')
  url_meals =  scrapping_h3_href(doc, 'teaser-items')
  names.each_with_index do |recipe, index|
    recipe_page = Nokogiri::HTML(open(url_meals[index]), nil, 'utf-8')
    servings = recipe_page.at("//span[@itemprop = 'recipeYield']").children.text.scan(/\d/)[0]
    steps = scrapping_search(recipe_page, ".method__list")
    recipe = Recipe.new(
      name: names[index],
      # steps: steps,
      dish_type: meal_type,
      dish_origin: meal_origin,
      prep_time: prep_times[index],
      servings: servings,
      description: description,
      # difficulty: difficulty,
      )
    p recipe.description
    ingredients = scrapping_search(recipe_page, ".ingredients-list__item").each do |ingredient|
      quantity = ingredient.split(" ")[0].scan(/\d/).join.to_i
      unit = ingredient.split(" ")[0].scan(/\D/).join
      unit = 'tbsp' if unit == ""
      ingredient = Ingredient.new(
      recipe_id: recipe.id,
      quantity: quantity,
      unit: unit,
      name: ingredient.split(" ").drop(1).join(" "),
      )
      p ingredient
    end
  end
end
scrapping('dessert', 'french')


def scrapping_search(doc, tag)
  array = []
  doc.search(tag).each { |recipe| array << recipe.text.strip }
  array
end


def scrapping_h3_href(doc, tag)
  doc.xpath('//h3[@class="teaser-item__title"]/a/@href').map { |recipe| URL_BBC + recipe.value }
  # doc.search(tag).map { |recipe| recipe.value }
end

def cooking_time(cooking_time_array)
  cooking_time_array.map do |time|
    if time.include?("hour") || time.include?("hours")
      time = time.split(" ")
      hours = time[0].to_i * 60
      minutes = time.drop(1).join(" ").scan(/\d/).join('').to_i
      time = minutes + hours
    else
      time = time.split(" ")
      time = time[0].to_i
    end
    p time
  end
end
prep_times = cooking_time(scrapping_search(doc, ".teaser-item__info-item--total-time"))


names.each_with_index do |recipe, index|
    recipe_page = Nokogiri::HTML(open(url_meals[index]), nil, 'utf-8')
    # ingredients = scrapping_search(recipe_page, ".ingredients-list__item")
    servings = recipe_page.at("//span[@itemprop = 'recipeYield']").children.text.scan(/\d/)[0]
    .scan(/\d/)
    p servings
    # p ingredients
 end

