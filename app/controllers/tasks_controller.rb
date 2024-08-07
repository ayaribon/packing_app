class TasksController < ApplicationController
  def index
    @travel_plan = TravelPlan.find(params[:travel_plan_id])
    @tasks = @travel_plan.tasks
  end

  def new
    @travel_plan = TravelPlan.find(params[:travel_plan_id])
    @task = @travel_plan.tasks.build
  end

  def create
    @travel_plan = TravelPlan.find(params[:travel_plan_id])
    @task = @travel_plan.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to travel_plan_tasks_path(@travel_plan)
    else
      render :new
    end
  end

  def edit
    @travel_plan = TravelPlan.find(params[:travel_plan_id])
    @task = @travel_plan.tasks.find(params[:id])
  end

  def update
    @travel_plan = TravelPlan.find(params[:travel_plan_id])
    @task = @travel_plan.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to travel_plan_tasks_path(@task)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @travel_plan = TravelPlan.find(params[:travel_plan_id])
    task = @travel_plan.tasks.find(params[:id])
    task.destroy!
    redirect_to travel_plan_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :status, :baggage, :due)
  end
end
