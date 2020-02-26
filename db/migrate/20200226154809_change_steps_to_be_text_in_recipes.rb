class ChangeStepsToBeTextInRecipes < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :steps, :text
  end
end
