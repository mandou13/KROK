class RatingsController < ApplicationController

  def create
    @planner = current_user.planners.last

    @planner_recipe = PlannerRecipe.find(params[:planner_recipe_id])
    @planner_recipe.cooked = true
    @planner_recipe.save

    @rating = Rating.new(
      user:   current_user,
      recipe: @planner_recipe.recipe,
      rating: params[:rating][:rating].to_i
    )
    @rating.save
    redirect_to planner_path(@planner)
  end

  private

  def rating_params
    # cf lecture
  end
end
