class TasksController < ApplicationController

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[task_params])
    @task.save
    redirect_to root_path
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date)
  end

end
