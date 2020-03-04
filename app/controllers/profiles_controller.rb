class ProfilesController < ApplicationController
  def show
    @user = current_user
    @ingredients = Ingredient.all.map
    ingredients_sorted = @ingredients.map{|ingredient| ingredient.name}.uniq.sort
    @ingredients_sorted = ingredients_sorted.map {|ingredient| Ingredient.where(name: ingredient).first}
    @preference = Preference.new
    @user_preferences = current_user.preferences
  end
end
