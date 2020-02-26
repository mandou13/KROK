class AddStepsToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :steps, :string
  end
end
