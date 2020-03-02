class ShoppingList < ApplicationRecord
  belongs_to :planner

   def bought?
    self.bought == true
  end

  def mark_as_bought
    self.bought = true
  end


  def is_duplicate?
    # je regarde les autres ingrédients du même planner
    # si y a un doublon tu supprimes l'ancien et tu ajoutes les valeurs au nouveau
    # en faisant gaffe avec les unités
    all_ingredients = ShoppingList.all.select{ |item| item.planner_id == self.planner.id }
    ingredient_array = all_ingredients.select{ |ingredient| ingredient.ingredient_name == self.ingredient_name }
    p ingredient_array
    # p ingredient_array = ShoppingList.where(planner: self.planner, ingredient_name: self.ingredient_name)
    ingredient_array.length > 1
    # ShoppingList.where(planner: self.planner, ingredient_name: self.ingredient_name).present?
  end

  def merge
    ingredients_hash = {}
    # all_ingredients = ShoppingList.all.select{ |item| item.planner_id == self.planner.id }
    shopping_lists = ShoppingList.where(planner: self.planner)
    # p shopping_lists
    shopping_lists.each do |shopping_list|
      if ingredients_hash.key?(shopping_list.ingredient_name)
        ingredients_hash[shopping_list.ingredient_name] << [shopping_list.quantity, shopping_list.unit]
      else
        ingredients_hash[shopping_list.ingredient_name] = [[shopping_list.quantity, shopping_list.unit]]
      end
    end
    p ingredients_hash
    # ingredients_hash.each do |key, value|
    #   ingredient = ShoppingList.where(ingredient_name: key)
    #   units    = []
    #   quantity = []
    #   value.each do |array|
    #     quantity << array[0]
    #     # p quantity
    #     units    << array[1]
    #   end
    #   if units.uniq.length == 1
    #     good_values = [quantity.sum, units[0]]
    #     p good_values
    #   elsif units.include?('g')
    #     unit_converter  = {}
    #     unit_converter["tbsp"] = 12
    #     unit_converter["tsp"] = 5
    #     unit_converter["kg"] = 1000
    #     unit_converter["bunch"] = 100
    #     unit_converter["clove"] = 5
    #     unit_converter["g"]  = 1
    #     unit_converter[nil] = 60
    #     good_quantity = units.each_with_index.map {|unit, index| unit_converter[unit] * quantity[index]}
    #     good_values = [good_quantity.sum,"g"]
    #     p good_values
    #   elsif units.include?('ml')
    #     unit_converter  = {}
    #     unit_converter["tbsp"] = 12
    #     unit_converter["tsp"] = 5
    #     unit_converter["ml"] = 1
    #     unit_converter["l"] = 1000
    #     good_quantity = units.each_with_index.map {|unit, index| unit_converter[unit] * quantity[index]}
    #     good_values = [good_quantity.sum,"ml"]
    #     p good_values
    #   end
    #   ingredient.update(quantity: good_values[0], unit: good_values[1])
    # end
  end
end
