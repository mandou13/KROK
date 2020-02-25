class Planner < ApplicationRecord
  belongs_to :user
  has_many :planner_recipes
end
