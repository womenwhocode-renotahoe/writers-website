class WritersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:show, :index]
  before_filter :set_writer, only: [:show]
  before_filter :check_current_owner_writer, except: [:show, :index]

  def index
    @writers = Writer.all
  end

  def new
    @writer = Writer.new
  end

  def create
    @writer = Writer.new(writer_params)
    if @writer.save
      redirect_to wall_writer_path(@writer)
    else
      flash.now[:error] = "Failed to create writer"
      render :new
    end
  end

  def show
    @writer = Writer.find(params[:id])
    @stories = @writer.stories.published
  end

  def edit
    @writer = Writer.find(params[:id])
  end

  def update
    @writer = Writer.find(params[:id])
    if @writer.update(writer_params)
      @writer.user.save!
      redirect_to wall_writer_path(@writer)
    else
      flash.now[:error] = "Failed to update writer"
      render :edit
    end
  end

  def wall
    @writer = Writer.find(params[:id])
    @user = @writer.user
    @latest_story = @writer.stories.latest.first
    @activities = @writer.activities.latest
    @activity = Activity.new
    @progress_goals = @writer.goals
    respond_to do |format|
      format.html
      format.json
    end
  end

  def become
    writer = Writer.find(params[:id])
    sign_in(:user, User.find(writer.user_id))
    redirect_to wall_writer_path(writer)
  end

  def check_current_owner_writer
    return if admin_user_signed_in?
    @writer = Writer.find(params[:writer_id] || params[:id])
    raise ActiveRecord::RecordNotFound unless @writer.user_id == current_user.id
  end

  def set_writer
    @writer ||= Writer.find(params[:writer_id] || params[:id])
  end

  private

  def writer_params
    params.require(:writer).permit(:twitter, :full_name, :bio, :location, :birthdate)
  end

  def set_activity
    @activity = @writer.activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:goal_id, :count, :date)
  end
end
