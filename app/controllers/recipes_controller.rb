class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_recipe, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :dish_type, :dish_origin, :prep_time, :servings)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
