class TasksController < ApplicationController
  before_action :sets_space, only: [:new, :create, :destroy]

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.space = @space
    @task.user = current_user
    if @task.save
      redirect_to user_space_path(current_user, @space)
    else
      redirect_to user_space_path(current_user, @space), status: :unprocessable_entity
      # render :new, status: :unprocessable_entity
    end
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_space_path(current_user, @space), status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:description, :user_id)
  end

  def sets_space
    @space = Space.find(params[:space_id])
  end
end
