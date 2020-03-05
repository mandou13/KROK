class LikedRecipesController < ApplicationController
  def index
    if params[:query].present?
      @liked_recipes = []
      unless LikedRecipe.global_search(params[:query]).empty?
        @liked_recipes = LikedRecipe.global_search(params[:query])
        @liked_recipes = @liked_recipes.to_a
        @main = @liked_recipes.select { |liked_recipe| liked_recipe.recipe.dish_type == 'main' }.size > 0
        @starter = @liked_recipes.select { |liked_recipe| liked_recipe.recipe.dish_type == 'starter' }.size > 0
        @dessert = @liked_recipes.select { |liked_recipe| liked_recipe.recipe.dish_type == 'dessert' }.size > 0
      end
      unless Ingredient.search_by_ingredient(params[:query]).empty?
        Ingredient.search_by_ingredient(params[:query]).each do |ingredient|
          current_user.liked_recipes.each do |liked_recipe|
            @liked_recipes << liked_recipe if liked_recipe.recipe.id == ingredient.recipe_id
            @liked_recipes = @liked_recipes.uniq
          end
        end
        @main = @liked_recipes.select { |liked_recipe| liked_recipe.recipe.dish_type == 'main' }.size > 0
        @starter = @liked_recipes.select { |liked_recipe| liked_recipe.recipe.dish_type == 'starter' }.size > 0
        @dessert = @liked_recipes.select { |liked_recipe| liked_recipe.recipe.dish_type == 'dessert' }.size > 0
      end
    else
      @liked_recipes = current_user.liked_recipes
      @main = true
      @starter = true
      @dessert = true
    end
  end

  def create
    @liked_recipe = LikedRecipe.new
    @liked_recipe.user = current_user
    @liked_recipe.recipe = Recipe.find(params[:recipe_id])
    @liked_recipe.save
    if URI(request.referer).path.index("recipes/#{@liked_recipe.recipe.id}") == 1
      redirect_to recipe_path(@liked_recipe.recipe)
    else
      redirect_to recipes_path
    end
  end

  def destroy
    @liked_recipe = LikedRecipe.find(params[:id])
    @liked_recipe.destroy
    if URI(request.referer).path.index("liked_recipes") == 1
      redirect_to liked_recipes_path
    elsif URI(request.referer).path.index("recipes/#{@liked_recipe.recipe.id}") == 1
      redirect_to recipe_path(@liked_recipe.recipe)
    else
      redirect_to recipes_path
    end
  end
end
