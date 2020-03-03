class ShoppingListsController < ApplicationController
  def index
    @planner        = Planner.find(params[:planner_id])
    @shopping_lists = @planner.shopping_lists.sort_by(&:ingredient_name)
    @categories = []
    @shopping_lists.each {|shopping_list| @categories  << shopping_list.category}
    @categories = @categories.uniq.sort
  end

  def update
    @planner        = Planner.find(params[:planner_id])
    @shopping_item  = ShoppingList.find(params[:id])
    @shopping_item.bought = !@shopping_item.bought
    @shopping_item.save
    redirect_to planner_shopping_lists_path(@planner)
  end
end
