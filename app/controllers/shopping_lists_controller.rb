class ShoppingListsController < ApplicationController
  def index
    @planner        = Planner.find(params[:planner_id])
    @shopping_lists = @planner.shopping_lists.sort_by(&:ingredient_name)
    @categories = []
    @shopping_lists.each {|shopping_list| @categories  << shopping_list.category}
    @categories = @categories.uniq.sort
    @categories_all_except_other = ["Vegetable", "Meat", "Beverage Alcoholic", "Bakery", "Dairy", "Fish", "Fruit", "Herb and Spice", "Canned  Goods"]
    @categories_other = ["Condiment", "Dry", "Flower"  "Dish", "Nuts & Seed", "Beverage" "Dairy Substitute", "Plant"]

  end

  def update
    @planner        = Planner.find(params[:planner_id])
    @shopping_item  = ShoppingList.find(params[:id])
    @shopping_item.bought = !@shopping_item.bought
    @shopping_item.save
    if @shopping_item.save
      respond_to do |format|
        format.html { redirect_to planner_shopping_lists_path(@planner) }
        format.js
      end
  end
  end
end
