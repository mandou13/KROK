class ShoppingListsController < ApplicationController
  def index
    @planner        = Planner.find(params[:planner_id])
    @shopping_lists = @planner.shopping_lists.sort_by(&:ingredient_name)
    @categories = []
    @shopping_lists.each {|shopping_list| @categories  << shopping_list.category}
    @categories = @categories.uniq.sort
  end

  def update
  end
end
