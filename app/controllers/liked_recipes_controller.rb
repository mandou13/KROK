class LikedRecipesController < ApplicationController
  def index
    @liked_recipes = current_user.liked_recipes
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
