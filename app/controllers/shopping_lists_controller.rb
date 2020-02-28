class ShoppingListsController < ApplicationController
  def index
    @shopping_list = current_user.planners.last.shopping_lists
    @planner = current_user.planners.last
    @planner_recipes = @planner.planner_recipes.map { |planner_recipe| planner_recipe.recipe }
    @ingredients = []
    @planner_recipes.each {|recipe_instance| @ingredients << recipe_instance.ingredients}
  end

  def update
  end
end
