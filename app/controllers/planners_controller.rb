class PlannersController < ApplicationController
  skip_before_action :number_of_unseen_planner_recipes
  before_action :set_planner_recipes_to_seen, only: [:show]

  def show

    @planners_show = true

    @recipes = Recipe.all
    @recipes_starter = Recipe.where(dish_type: 'starter')
    @recipes_main = Recipe.where(dish_type: 'main')
    @recipes_dessert = Recipe.where(dish_type: 'dessert')
    @recipes_all = [@recipes_starter, @recipes_main, @recipes_dessert]

    @planner = Planner.find(params[:id])

    @planner_recipes = @planner.planner_recipes.sort
    @planner_recipes_main = @planner.planner_recipes.select { |planner_recipe| planner_recipe.recipe.dish_type == 'main'}.sort
    @planner_recipes_starter = @planner.planner_recipes.select { |planner_recipe| planner_recipe.recipe.dish_type == 'starter'}.sort
    @planner_recipes_dessert = @planner.planner_recipes.select { |planner_recipe| planner_recipe.recipe.dish_type == 'dessert'}.sort
    @planner_recipes_all = [@planner_recipes_starter, @planner_recipes_main, @planner_recipes_dessert]
    @rating = Rating.new
  end

  def create
    @planner = Planner.new(
      name: "#{Time.now.strftime("%d")}/#{Time.now.strftime("%m")} Menu",
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

  def add_from_previous_planner
    @old_planner = Planner.find(params[:id])
    @new_planner = current_user.planners.last

    @old_planner.planner_recipes.each do |old_pr|
      new_pr = PlannerRecipe.new(recipe_id: old_pr.recipe.id, planner_id: @new_planner.id, servings: old_pr.servings)

      if new_pr.repeatedly_created?(@new_planner)
        @new_planner.planner_recipes.each do |pr|
          if pr.recipe.id == new_pr.recipe.id
            pr.servings += new_pr.servings
            pr.save
          end
        end
      else
        new_pr.save
      end
    end

    redirect_to planner_path(@new_planner)
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
