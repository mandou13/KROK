class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :dish_type
      t.string :dish_origin
      t.integer :prep_time
      t.integer :servings
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
