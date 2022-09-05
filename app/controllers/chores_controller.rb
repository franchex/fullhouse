class ChoresController < ApplicationController
  before_action :sets_space, only: [:new, :create, :destroy]
  def new
    @chore = Chore.new
    @category = params[:category] if params[:category]
  end

  def create
    @chore = Chore.new(chore_params)
    @chore.space = @space
    if @chore.save
      redirect_to space_chores_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @chores = Chore.all
    @space = Space.find(params[:space_id])
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy
    redirect_to user_space_path(current_user, @space), status: :see_other
  end

  private

  def chore_params
    params.require(:chore).permit(:name, :due_date, :category, :description, :user_id)
  end

  def sets_space
    @space = Space.find(params[:space_id])
  end
end
