class ProfilesController < ApplicationController
  def show
    @user = current_user
    @ingredients = Ingredient.all
    @preference = Preference.new
    @user_preferences = current_user.preferences
  end
end
