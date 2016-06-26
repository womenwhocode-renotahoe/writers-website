class GoalsController < ApplicationController
  before_action :set_writer

  def index
    @goals = @writer.goals
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      flash[:success] = "Goal updated"
      redirect_to writer_path(@goal.writer_id)
    else
      flash.now[:error] = "Goal failed to update"
      render :edit
    end
  end

  private

  def set_writer
    @writer = current_user.writer
  end

  def goal_params
    params.require(:goal).permit(:goal_count, :goal_freq)
  end
end