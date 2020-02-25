class CreatePlannerRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :planner_recipes do |t|
      t.boolean :cooked
      t.integer :servings
      t.references :planner, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
