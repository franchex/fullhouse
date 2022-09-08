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
    @tasks = @space.tasks
    @task.space = @space
    @task.user = current_user
    respond_to do |format|
      if @task.save
        format.html { redirect_to user_space_path(current_user, @space) }
        format.json
      else
        format.html { redirect_to user_space_path(current_user, @space), status: :unprocessable_entity }
        format.json
      end
    end
  end

  def destroy
    @tasks = @space.tasks
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to user_space_path(current_user, @space), status: :see_other }
      format.json
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :user_id)
  end

  def sets_space
    @space = Space.find(params[:space_id])
  end
end
