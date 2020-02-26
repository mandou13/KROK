class PlannersController < ApplicationController
  def show
    @planner = Planner.find(params[:id])
  end

  def create
  end

  def update
  end
end
