class Recipe < ApplicationRecord
  belongs_to :user
  validates  :name, presence: true
  validates  :description, presence: true, uniqueness: true, length: { minimum: 30 }
  validates  :dish_type, inclusion: { in: ['Dessert', 'Starter', 'Appetizer', 'Main Course', 'Side', 'Snack'] }
  validates  :dish_origine, inclusion: { in: ['Italian', 'Indian', 'French', 'Greek', 'English', 'Chinese',  'Middle East', 'Thai', 'Vietnamese', 'Spanish',  'Asian', 'Korean', 'American', 'German'] }
  validates  :prep_time, presence: true
  validates  :servings, presence: true
end
