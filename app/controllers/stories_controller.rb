class StoriesController < ApplicationController

  def index

  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def story_params
    params.require(:story).permit(:title, :summary, :body)
  end

  def set_writer
    @writer = Writer.find(params[:writer_id])
  end
end
