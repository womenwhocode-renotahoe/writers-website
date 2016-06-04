class WriterGoalsController < ApplicationController
  before_action :set_writer

  def index
    @writer_goals = @writer.writer_goals.includes(:goal)
  end

  def show
    @writer_goal = WriterGoal.find(params[:id])
  end

  def edit
    @writer_goal = WriterGoal.find(params[:id])
  end

  def update
    @writer_goal = WriterGoal.find(params[:id])
    if @writer_goal.update(writer_goal_params)
      flash[:success] = "Writer goal updated"
      redirect_to writer_path(@writer_goal.writer_id)
    else
      flash.now[:error] = "Writer goal failed to update"
      render :edit
    end
  end

  private

  def set_writer
    @writer = current_user.writer
  end

  def writer_goal_params
    params.require(:writer_goal).permit(:value)
  end
end