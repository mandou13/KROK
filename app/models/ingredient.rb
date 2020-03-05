class Ingredient < ApplicationRecord
  belongs_to :recipe
  has_many :preferences, dependent: :destroy
  # validates  :unit, inclusion: { in: ['g', 'L', 'Teaspoon', 'Tablespoon' 'Pinch']}, presence: true
  validates  :name, presence: true
  validates  :quantity,  presence: true
  validates  :category, inclusion: { in: ["Vegetable", "Plant", "Fruit", "Condiment", "Nuts & Seed", "Dish", "Dry", "Bakery", "Fish", "Herb and Spice", "Meat", "Beverage Alcoholic", "Beverage", "Dairy", "Flower", "Canned Goods", "Dairy Substitute"] }

  include PgSearch::Model
  pg_search_scope :search_by_ingredient,
    against: [:name],
    using: {
      tsearch: { prefix: true }
    }

  def krok_unit?
    return false if self.unit.nil?
    self.unit.match?(/^(ml)$|^(g)$/)
  end


  def convert_ingredient_to_krok_unit
    unit = self.unit
    quantity = self.quantity

    if unit.nil?
      converted_quantity = quantity
      converted_unit = ''
    elsif unit.split('').include?('g')
      converted_quantity = quantity * 1000 if unit == 'kg'
      converted_unit = 'g'
    elsif unit.split('').include?('l') && unit != 'clove'
      converted_quantity = quantity * 1000 if unit == 'l'
      converted_unit = 'ml'
    else
      converted_quantity = quantity * 12  if unit == 'tbsp'
      converted_quantity = quantity * 5   if unit == 'tsp'
      converted_quantity = quantity * 100 if unit == 'bunch'
      converted_quantity = quantity * 5   if unit == 'clove'
      converted_unit = 'g'
    end
    self.quantity = converted_quantity
    self.unit = converted_unit
    self
  end



end
