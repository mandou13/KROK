class CreateShoppingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_lists do |t|
      t.string :ingredient_name
      t.integer :quantity
      t.string :unit
      t.boolean :bought
      t.references :planner, foreign_key: true

      t.timestamps
    end
  end
end
