class ShoppingList < ApplicationRecord
  belongs_to :planner

   def bought?
    self.bought == true
  end

  def mark_as_bought
    self.bought = true
  end
end
