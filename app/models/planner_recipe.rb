class PlannerRecipe < ApplicationRecord
  belongs_to :planner
  belongs_to :recipe
  validates  :servings, presence: true
end
