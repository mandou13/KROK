class ProfilesController < ApplicationController
  def show
    @user = current_user
    @ingredients = Ingredient.all
    @preference = Preference.new
    @user_ingredients = current_user.ingredients
  end
end
