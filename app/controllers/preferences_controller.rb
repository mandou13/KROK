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
end
