class Ingredient < ApplicationRecord
  belongs_to :recipe
  # validates  :unit, inclusion: { in: ['g', 'L', 'Teaspoon', 'Tablespoon' 'Pinch']}, presence: true
  validates  :name, presence: true
  validates  :quantity,  presence: true
  validates  :category, inclusion: { in: ["Vegetable", "Plant", "Fruit", "Condiment", "Nuts & Seed", "Dish", "Dry", "Bakery", "Fish", "Herb and Spice", "Meat", "Beverage Alcoholic", "Beverage", "Dairy", "Flower", "Canned Goods", "Dairy Substitute"] }

  include PgSearch::Model
  pg_search_scope :search_by_ingredient,
    against: [ :name],
    using: {
      tsearch: { prefix: true }
    }

  def categories_of_recipe

  end
end
