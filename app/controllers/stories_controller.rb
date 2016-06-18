class StoriesController < ApplicationController

  before_action :set_writer

  def index
    @stories = @writer.stories
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    @story.writer_id = @writer.id
    if @story.save
      flash[:success] = "Created new story"
      redirect_to wall_path(@writer)
    else
      flash.now[:error] = "Failed to create story"
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      flash[:success] = "Updated story: " + @story.title
      redirect_to writer_story_path(@writer, @story)
    else
      flash.now[:error] = "Failed to update story: " + @story.title
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:id])
    if @story.destroy
      flash[:success] = "Deleted story: " + @story.title
      redirect_to writer_stories_path(@writer)
    else
      flash[:error] = "Failed to delete story: " + @story.title
      redirect_to request.referrer
    end
  end

  private

  def story_params
    params.require(:story).permit(:title, :summary, :body)
  end

  def set_writer
    @writer = Writer.find(params[:writer_id])
  end
end
