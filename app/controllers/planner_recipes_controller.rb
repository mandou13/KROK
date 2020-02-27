class PlannerRecipesController < ApplicationController

  def create
  end

  def update
    @planner = Planner.find(params[:planner_id])
    @planner_recipe = PlannerRecipe.find(params[:id])
    @planner_recipe.cooked = !@planner_recipe.cooked
    @planner_recipe.save
    redirect_to planner_path(@planner)
  end

  def destroy
  end
end
