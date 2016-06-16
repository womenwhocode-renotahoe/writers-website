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
    @user = User.find(params[:id])
    @writer = Writer.find_by_user_id(@user.id)
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
      redirect_to writer_path(@writer)
    else
      flash.now[:error] = "Failed to update writer"
      render :edit
    end
  end

  def wall
    @writer = Writer.find(params[:id])
    @stories = @writer.stories.all
  end

  private

  def writer_params
    params.require(:writer).permit(:twitter, :full_name, :bio, :location, :birthdate)
  end
end
