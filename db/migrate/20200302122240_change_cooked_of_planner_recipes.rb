class ChangeCookedOfPlannerRecipes < ActiveRecord::Migration[5.2]
  def change
    change_column_default :planner_recipes, :cooked, false
  end
end
