class PreferencesController < ApplicationController

  def create
    @preference = Preference.new(
      user_id: current_user.id,
      ingredient_id: params[:preference][:ingredient]
      )
    if @preference.save
      redirect_to profile_path
    else
      redirect_to preferences_path
    end
  end

  def destroy
    @preference = Preference.find(params[:id])
    @preference.destroy
    redirect_to profile_path

  end
end
