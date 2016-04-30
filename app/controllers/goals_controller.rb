class GoalsController < ApplicationController

  before_action :set_user

  def index
    @goals = @user.goals.includes(:writer_goals)
  end

  def show
    @goal = Goal.find(params[:id]).includes(:writer_goals)
  end

  private

  def set_user
    @user = User.find(params[:user_id]) || User.find(params[:id])
  end
end
