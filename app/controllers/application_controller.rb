class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :number_of_unseen_planner_recipes, only: [:index, :show]

  private

  def number_of_unseen_planner_recipes
    @set_planner_recipes_to_seen = PlannerRecipe.all
    @number_of_unseen_planner_recipes = 0
    @set_planner_recipes_to_seen.each do |planner_recipe|
      @number_of_unseen_planner_recipes += 1 if planner_recipe.seen == false
    end
  end

end
