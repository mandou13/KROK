class AddSeenToPlannerRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :planner_recipes, :seen, :boolean, default: false
  end
end
