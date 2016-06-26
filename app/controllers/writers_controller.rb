class WritersController < ApplicationController
  before_filter :authorize_admin, only: [:index]

  def index
    @writers = Writer.all
  end

  def new
    @writer = Writer.new
  end

  def create
    @writer = Writer.new(writer_params)
    if @writer.save
      redirect_to writer_path(@writer)
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
      @writer.user.state << 'Profile updated' unless @writer.user.state.include?('Profile updated')
      @writer.user.save!
      redirect_to wall_path(@writer)
    else
      flash.now[:error] = "Failed to update writer"
      render :edit
    end
  end

  def wall
    @writer = Writer.find(params[:id])
    @user = @writer.user
    @latest_story = @writer.stories.latest.first
    if current_user == @user then
      @stories = @writer.stories.all
    else
      flash.now[:error] = "Not your wall"
      redirect_to writer_path
    end
    @goals = @writer.goals
  end

  private

  def writer_params
    params.require(:writer).permit(:twitter, :full_name, :bio, :location, :birthdate)
  end
end
