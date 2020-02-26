class LikedRecipesController < ApplicationController
  def index
    @liked_recipes = current_user.liked_recipes
  end

  def create
  end

  def destroy
  end
end
