class LikedRecipesController < ApplicationController
  def index
    @liked_recipes = current_user.liked_recipes
  end

  def create
    @liked_recipe = LikedRecipe.new
    @liked_recipe.user = current_user
    @liked_recipe.recipe = Recipe.find(params[:recipe_id])
    @liked_recipe.save
  end

  def destroy
    @liked_recipe = LikedRecipe.find(params[:id])
    @liked_recipe.destroy
    redirect_to liked_recipes_path if URI(request.referer).path.index("liked_recipes") == 1
  end
end
