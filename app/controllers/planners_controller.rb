class PlannersController < ApplicationController
  skip_before_action :number_of_unseen_planner_recipes
  before_action :set_planner_recipes_to_seen, only: [:show]

  def show
    @recipes = Recipe.all
    @recipes_starter = Recipe.where(dish_type: 'starter')
    @recipes_main = Recipe.where(dish_type: 'main')
    @recipes_dessert = Recipe.where(dish_type: 'dessert')
    # @recipes_appetizer = Recipe.where(dish_type: 'appetizer')
    # @recipes_side = Recipe.where(dish_type: 'side')
    # @recipes_snack = Recipe.where(dish_type: 'snack')
    # @recipes_other = @recipes_appetizer + @recipes_side + @recipes_snack
    @recipes_all = [@recipes_starter, @recipes_main, @recipes_dessert]
    @planner = current_user.planners.last
    @planner_recipes = @planner.planner_recipes.sort
    @planner_recipes_main = @planner.planner_recipes.select { |planner_recipe| planner_recipe.recipe.dish_type == 'main'}.sort
    @planner_recipes_starter = @planner.planner_recipes.select { |planner_recipe| planner_recipe.recipe.dish_type == 'starter'}.sort
    @planner_recipes_dessert = @planner.planner_recipes.select { |planner_recipe| planner_recipe.recipe.dish_type == 'dessert'}.sort
    # @planner_recipes_appetizer = @planner.planner_recipes.select { |planner_recipe| planner_recipe.recipe.dish_type == 'appetizer'}.sort
    # @planner_recipes_side = @planner.planner_recipes.select { |planner_recipe| planner_recipe.recipe.dish_type == 'side'}.sort
    # @planner_recipes_snack = @planner.planner_recipes.select { |planner_recipe| planner_recipe.recipe.dish_type == 'snack'}.sort
    # @planner_recipes_other = @planner_recipes_appetizer + @planner_recipes_side + @planner_recipes_snack
    @planner_recipes_all = [@planner_recipes_starter, @planner_recipes_main, @planner_recipes_dessert]
    @rating = Rating.new
  end

  def create
    @planner = Planner.new(
      name: Time.now.strftime("%D"),
      user_id: current_user.id)
    @planner.save
    redirect_to planner_path(@planner)
  end

  def update
    @planner = Planner.find(params[:id])
    if @planner.update(set_planner_params)
      redirect_to planner_path(@planner)
    else
      render :show
    end
  end

  private

  def set_planner_params
    params.require(:planner).permit(:name)
  end

  def set_planner_recipes_to_seen
    @set_planner_recipes_to_seen = PlannerRecipe.all
    @set_planner_recipes_to_seen.each do |planner_recipe|
      planner_recipe.seen = true
      planner_recipe.save
    end
  end
end


# dish_type, inclusion: { in: ['dessert', 'starter', 'appetizer', 'side', 'snack', 'main'] }
