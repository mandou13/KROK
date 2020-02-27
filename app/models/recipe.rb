class Recipe < ApplicationRecord
  belongs_to :user
  has_many   :ingredients
  has_many   :planner_recipes
  has_many   :liked_recipes
  has_many   :ratings

  validates  :name, presence: true
  validates  :description, presence: true, uniqueness: true
  validates  :dish_type, inclusion: { in: ['dessert', 'starter', 'appetizer', 'side', 'snack', 'main'] }
  validates  :dish_origin, inclusion: { in: ['Italian', 'Mexican', 'British', 'Indian', 'French', 'Greek', 'English', 'Chinese',  'Middle East', 'Thai', 'Vietnamese', 'Spanish',  'Asian', 'Korean', 'American', 'German'] }
  validates  :prep_time, presence: true
  validates  :servings, presence: true
  validates  :difficulty, inclusion: { in: ['Easy', 'Medium', 'Hard'] }


  has_one_attached :photo
end
