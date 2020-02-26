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
    recipe = Recipe.find(params[:recipe_id])
    @liked_recipe = LikedRecipe.find_by(user: current_user, recipe: recipe)
    @liked_recipe.destroy
  end
end
