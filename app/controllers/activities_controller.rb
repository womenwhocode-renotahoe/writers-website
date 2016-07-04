class ActivitiesController < ApplicationController
  before_action :set_writer, except: [:index, :show]

  def index
    @writer = Writer.find(params[:writer_id])
    @activities = @writer.activities.includes(:goal).order(date: :desc)
  end

  def new
    @activity = Activity.new(writer_id: @writer.id)
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.writer_id = @writer.id
    @activity.save!

    respond_to do |format|
      format.html { redirect_to @activity }
      format.js
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
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
    params.require(:activity).permit(:goal_id, :count, :date)
  end

  def set_writer
    @writer = current_user.writer
  end
end
