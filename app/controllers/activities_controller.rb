class ActivitiesController < ApplicationController
  before_action :set_writer, except: [:index, :show]

  def index
    @writer = Writer.find(params[:writer_id])
    @activities = @writer.activities.includes(writer_goal: [:goal])
  end

  def new
    @activity = Activity.new(writer_id: @writer.id)
  end

  def create
    @activity = Activity.new(activity_params)
    convert_goal(params[:activity][:writer_goal][:goal_id])
    @activity.writer_id = @writer.id
    if @activity.save
      flash[:success] = 'Activity logged'
      redirect_to writer_activities_path(@writer)
    else
      flash.now[:error] = 'Failed to log activity'
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    convert_goal(params[:activity][:writer_goal][:goal_id])
    if @activity.update(activity_params)
      flash[:success] = 'Activity updated'
      redirect_to writer_activities_path(@writer)
    else
      flash.now[:error] = 'Failed to update activity'
      render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    if @activity.destroy
      flash[:success] = 'Activity deleted'
      redirect_to writer_activities_path(@writer)
    else
      flash.now[:error] = 'Failed to delete activity'
      redirect_to request.referrer
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:date, :value, { writer_goal_attributes: [:goal_id] })
  end

  def convert_goal(goal_id)
    @goal = Goal.find(goal_id)
    @activity.description = @goal.activity_type
    @activity.writer_goal_id = WriterGoal.find_by(writer_id: @writer.id, goal_id: goal_id).id
  end

  def set_writer
    @writer = current_user.writer
  end
end
