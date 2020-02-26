class PlannersController < ApplicationController
  def show
    @planner = Planner.last
  end

  def create

  end

  def update
  end
end
