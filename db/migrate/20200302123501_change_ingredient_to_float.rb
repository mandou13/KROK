class ChangeIngredientToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :ingredients, :quantity, :float
  end
end
