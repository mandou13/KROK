class PlannersController < ApplicationController
  def show
    @planner = current_user.planners.last
  end

  def create
    @planner = Planner.new(
      name: Time.now.strftime("%D"),
      user_id: current_user.id)
    @planner.save
    redirect_to planner_path(@planner)
  end

  def update
    @planner = Planner.find(params[:id])
    if @planner.update(set_planner_params)
      redirect_to planner_path(@planner)
    else
      render :show
    end
  end

  def set_planner_params
    params.require(:planner).permit(:name)
  end
end
