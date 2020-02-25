class Planner < ApplicationRecord
  belongs_to :user
  has_many   :planner_recipes
  has_many   :shopping_lists
  has_many   :recipes, through: :planner_recipes
end
