class GoalsController < ApplicationController
  before_action :set_writer
  respond_to :html, :js

  def index
    @goals = @writer.goals
  end

  def edit
    @goal = @writer.goals.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      render :update
    else
      flash.now[:error] = 'Failed to update goal'
      render :edit
    end
  end

  private

  def set_writer
    @writer = current_user.writer
  end

  def goal_params
    params.require(:goal).permit(:count, :freq)
  end
end