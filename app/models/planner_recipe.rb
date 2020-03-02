class PlannerRecipe < ApplicationRecord
  belongs_to :planner
  belongs_to :recipe
  validates  :servings, presence: true, numericality: { greater_than_or_equal_to: 1 }

  after_create :update_shopping_lists

  def revert_cook_status
    if self.cooked
      self.cooked = false
      self.save
    else
      self.cooked = true
      self.save
    end
  end

  def update_shopping_lists
    quotient = self.servings.to_i.fdiv(self.recipe.servings.to_i)

    # p self.recipe.ingredients
    self.recipe.ingredients.each do |ingredient|
      ingredient.quantity = quotient * ingredient.quantity
      shopping_list = ShoppingList.create!(
        ingredient_name: ingredient.name,
        quantity:        ingredient.quantity.to_f,
        unit:            ingredient.unit,
        bought:          false,
        planner_id:      self.planner.id,
        category:        ingredient.category
      )
      # puts "Je crée un ingrédient"
       p shopping_list
      # puts "Je regarde  si c'est un doublon"
      # p shopping_list.is_duplicate?
      # puts "Si oui je merge"
      shopping_list.merge if shopping_list.is_duplicate?
    end
  end
  # Attention si jamais je destroy une recette ilfaut supprimer
end



# @shopping_list   = current_user.planners.last.shopping_lists
#     @planner         = current_user.planners.last
#     @planner_recipes = @planner.planner_recipes.map { |planner_recipe| planner_recipe.recipe }
#     @planner_recipes_instance = []
#     @planner.planner_recipes.each { |planner_recipe| @planner_recipes_instance << planner_recipe}

#     #all ingredients + quotient per serving
#     @ingredients = []
#     @quotient = {}
#     @planner_recipes.each do |recipe_instance|
#       @ingredients << recipe_instance.ingredients
#       @quotient[recipe_instance.id] = recipe_instance.servings / @planner_recipes_instance.select{ |planner_recipe| planner_recipe.recipe_id == recipe_instance.id}.first.servings
#     end
#     #unique categories
#     @categories = []
#     @ingredients_hash = {}
#     @ingredients.each do |ingredient_collection|
#       ingredient_collection.each do |ingredient|
#         # @test = @quotient[ingredient.recipe_id]
#         @categories << ingredient.category
#         if @ingredients_hash.key?(ingredient.name)
#           @ingredients_hash[ingredient.name] << [ingredient.quantity * @quotient[ingredient.recipe_id], ingredient.unit]
#         else
#           @ingredients_hash[ingredient.name] = [[ingredient.quantity * @quotient[ingredient.recipe_id], ingredient.unit]]
#         end
#       end
#     end
#     @ingredients_hash.map do |key, value|
#       units = []
#       keyrs = []
#       value.each do |array|
#         keys << values[0]
#         units << value[1]
#       end
#       if units.uniq.size == 1
#         value = [keys.sum, units[0]]
#       else

#       end
#     end
#     @categories = @categories.uniq
