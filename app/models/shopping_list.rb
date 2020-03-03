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
    # p ingredient_array = ShoppingList.where(planner: self.planner, ingredient_name: self.ingredient_name)
    ingredient_array.length > 1
    # ShoppingList.where(planner: self.planner, ingredient_name: self.ingredient_name).present?
  end

  def merge(reference)

    # j'ai 2 instances, une réference et l'autre

    reference.quantity += self.quantity
    reference.save!
    self.destroy


    ingredients_hash = {}


    # all_ingredients = ShoppingList.all.select{ |item| item.planner_id == self.planner.id }
    self.ingredient_name
    shopping_lists = ShoppingList.where(planner: self.planner, ingredient_name: self.ingredient_name).delete(self)

    shopping_lists.each do |shopping_list|

      unit = shopping_list.unit
      quantity = shopping_list.quantity

    end

    # iterer sur les shopping_lists




    # ingredient_array = shopping_lists.select{ |ingredient| ingredient == self }
    ingredient_array.each do |ingredient|

      ingredients_hash[ingredient.ingredient_name] << [ingredient.quantity, ingredient.unit]
    end
    ingredients_hash[self.ingredient_name] << [self.quantity, self.unit]
    # p shopping_lists
    # shopping_lists.each do |shopping_list|
    #   if ingredients_hash.key?(shopping_list.ingredient_name)
    #     ingredients_hash[shopping_list.ingredient_name] << [shopping_list.quantity, shopping_list.unit]
    #   else
    #     ingredients_hash[shopping_list.ingredient_name] = [[shopping_list.quantity, shopping_list.unit]]
    #   end
    # end
    p ingredients_hash
    good_values = []
    ingredients_hash.each do |key, value|
      ingredient = ShoppingList.where(ingredient_name: key)
      units    = []
      quantity = []
      value.each do |array|
        quantity << array[0]
        # p quantity
        units    << array[1]
      end
      if units.uniq.length == 1
        good_values = [quantity.sum, units[0]]
        p "good quantities"
        p good_values
      end

      ingredient.update(quantity: good_values[0], unit: good_values[1])
      p ingredient
    end
  end

end
