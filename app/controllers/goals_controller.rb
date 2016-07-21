class GoalsController < WritersController
  before_filter :set_writer
  before_filter :check_current_owner_writer

  respond_to :html, :js

  def index
    @goals = @writer.goals
  end

  def edit
    @goal = @writer.goals.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      render :update
    else
      flash.now[:error] = 'Failed to update goal'
      render :edit
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:count, :freq)
  end
end