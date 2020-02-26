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


def scrapping(meal_type)
  url_search = URL_BBC + 'search/recipes?query='  + meal_type
  doc = Nokogiri::HTML(open(url_search), nil, 'utf-8')
  names = scrapping_search(doc, ".teaser-item__title")
  prep_times = scrapping_search(doc, ".mins")
  url_meals =  scrapping_h3_href(doc, 'teaser-item__title')
  recipe =
  servings = scrapping_search(doc, ".recipe-details__text").scan(/\d/)
  description = scrapping_search(doc, "method__list")
  Recipe.new(
    name: name,
    description: description,
    dish_type: meal_type,
    dish_origin: ,
    prep_time: prep_time,
    servings: servings,
    )

end


def scrapping_search(doc, tag)
  array = []
  doc.search(tag).each { |recipe| array << recipe.text.strip }
  array
end


def scrapping_h3_href(doc, tag)
  doc.xpath('//h3[@class="teaser-item__title"]/a/@href').map { |recipe| URL_BBC + recipe.value }
  # doc.search(tag).map { |recipe| recipe.value }
end




