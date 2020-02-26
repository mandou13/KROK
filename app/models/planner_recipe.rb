class PlannerRecipe < ApplicationRecord
  belongs_to :planner
  belongs_to :recipe
  validates  :servings, presence: true

  def revert_cook_status
    if self.cooked
      self.cooked = false
      self.save
    else
      self.cooked = true
      self.save
    end
  end
end
