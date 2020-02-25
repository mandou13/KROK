class Recipe < ApplicationRecord
  belongs_to :user
  has_many   :ingredients
  has_many   :planner_recipes
  has_many   :liked_recipes
  has_many   :ratings

  validates  :name, presence: true
  validates  :description, presence: true, uniqueness: true, length: { minimum: 30 }
  validates  :dish_type, inclusion: { in: ['Dessert', 'Starter', 'Appetizer', 'Main Course', 'Side', 'Snack'] }
  validates  :dish_origin, inclusion: { in: ['Italian', 'Indian', 'French', 'Greek', 'English', 'Chinese',  'Middle East', 'Thai', 'Vietnamese', 'Spanish',  'Asian', 'Korean', 'American', 'German'] }
  validates  :prep_time, presence: true
  validates  :servings, presence: true
end
