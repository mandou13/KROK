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
    # p ingredients_hash
    ingredients_hash.map do |key, value|
      units    = []
      quantity = []
      value.each do |array|
        quantity << array[0]
        # p quantity
        units    << array[1]
      end
      if units.uniq.size == 1
        value = [quantity.sum, units[0]]
        # p key
        # p value
      elsif units.include?('g')
        unit_converter  = {}
        unit_converter["tbsp"] = 0.02
        unit_converter["tsp"] = 0.005
        unit_converter["kg"] = 1
        unit_converter["bunch"] = 0.1
        unit_converter["clove"] = 0.003
        unit_converter["ml"] = 0.01
        unit_converter["g"]  = 0.01
        unit_converter["l"] = 1
        unit_converter[nil] = 0.06
        good_quantity = units.map {|unit| unit_converter[unit]}
        value = [good_quantity,"g"]
      elsif units.include?('l')
        value[1] = "l"
      end
      self.update(quantity: value[0], unit: value[1])
    end
  end
end
