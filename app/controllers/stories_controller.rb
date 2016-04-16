class StoriesController < ApplicationController

  before_action :set_writer

  def index
    @stories = @writer.stories
  end

  def new
    @story = Story.new
  end

  def create
    
  end

  def show
    @story = Story.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update
      redirect_to writer_story_path(@writer, @story)
    else

    end
  end

  def destroy
    @story = Story.find(params[:id])
  end

  private

  def story_params
    params.require(:story).permit(:title, :summary, :body)
  end

  def set_writer
    @writer = Writer.find(params[:writer_id])
  end
end
