class ShoppingListsController < ApplicationController
  def index
    @planner        = Planner.find(params[:planner_id])
    @shopping_lists = @planner.shopping_lists
    @categories = []
    @shopping_lists.each {|shopping_list| @categories  << shopping_list.category}
    @categories = @categories.uniq
    # @shopping_list   = current_user.planners.last.shopping_lists
    # @planner         = current_user.planners.last
    # @planner_recipes = @planner.planner_recipes.map { |planner_recipe| planner_recipe.recipe }
    # @planner_recipes_instance = []
    # @planner.planner_recipes.each { |planner_recipe| @planner_recipes_instance << planner_recipe}

    # #all ingredients + quotient per serving
    # @ingredients = []
    # @quotient = {}
    # @planner_recipes.each do |recipe_instance|
    #   @ingredients << recipe_instance.ingredients
    #   @quotient[recipe_instance.id] = recipe_instance.servings / @planner_recipes_instance.select{ |planner_recipe| planner_recipe.recipe_id == recipe_instance.id}.first.servings
    # end
    # #unique categories
    # @categories = []
    # @ingredients_hash = {}
    # @ingredients.each do |ingredient_collection|
    #   ingredient_collection.each do |ingredient|
    #     # @test = @quotient[ingredient.recipe_id]
    #     @categories << ingredient.category
    #     if @ingredients_hash.key?(ingredient.name)
    #       @ingredients_hash[ingredient.name] << [ingredient.quantity * @quotient[ingredient.recipe_id], ingredient.unit]
    #     else
    #       @ingredients_hash[ingredient.name] = [[ingredient.quantity * @quotient[ingredient.recipe_id], ingredient.unit]]
    #     end
    #   end
    # end
    # @ingredients_hash.map do |key, value|
    #   units = []
    #   keyrs = []
    #   value.each do |array|
    #     keys << values[0]
    #     units << value[1]
    #   end
    #   if units.uniq.size == 1
    #     value = [keys.sum, units[0]]
    #   else

    #   end
    # end
    # @categories = @categories.uniq
    #compile values
  end

  def update
  end
end
