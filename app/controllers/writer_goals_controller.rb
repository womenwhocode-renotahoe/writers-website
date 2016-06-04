class WriterGoalsController < ApplicationController

  def index
    @writer_goals = WriterGoal.all
  end

  def new
    @writer_goal = WriterGoal.new
  end

  def create

  end

  def edit
    @writer_goal = WriterGoal.find(params[:id])
  end

  def update
    @writer_goal = WriterGoal.find(params[:id])
    if @writer_goal.update
      flash[:success] = "Writer goal updated"
      redirect_to writer_path(@writer_goal.writer_id)
    else
      flash.now[:error] = "Writer goal failed to update"
      render :edit
    end
  end
end
