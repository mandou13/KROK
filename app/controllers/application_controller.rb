class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :number_of_unseen_planner_recipes, only: [:index, :show]
  before_action :create_planner

  private

    def number_of_unseen_planner_recipes
    @set_planner_recipes_to_seen = PlannerRecipe.all
    @number_of_unseen_planner_recipes = 0
    @set_planner_recipes_to_seen.each do |planner_recipe|
      @number_of_unseen_planner_recipes += 1 if planner_recipe.seen == false
    end

    def create_planner
      if user_signed_in? && current_user.planners.empty?
        Planner.create!(user_id: current_user.id, name: "#{Time.now.strftime("%d")}/#{Time.now.strftime("%m")} Menu")
      end
    end

  end
end
