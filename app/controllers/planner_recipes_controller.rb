class PlannerRecipesController < ApplicationController

  def create
    @planner_recipe = PlannerRecipe.new(cooked: false, servings: 1)
    @planner = current_user.planners.last
    @planner_recipe.planner = @planner
    @recipe = Recipe.find(params[:recipe_id])
    @planner_recipe.recipe = @recipe
    @planner_recipe.save!
  end

  def update
    @planner = Planner.find(params[:planner_id])
    @planner_recipe = PlannerRecipe.find(params[:id])
    @planner_recipe.cooked = !@planner_recipe.cooked
    @planner_recipe.save
    redirect_to planner_path(@planner)
  end

  def destroy
    @planner = Planner.find(params[:planner_id])
    @planner_recipe = PlannerRecipe.find(params[:id])
    @planner_recipe.destroy
    redirect_to planner_path(@planner)
  end

  private

  def set_planner_recipe_params
    params.require(:planner_recipe).permit(:cooked, :servings)
  end
end
