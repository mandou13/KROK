class AddCategoryToShoppingLists < ActiveRecord::Migration[5.2]
  def change
    add_column :shopping_lists, :category, :string
  end
end
