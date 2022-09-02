class ChoresController < ApplicationController

  def new
    @space = Space.find(params[:space_id])
    @chore = Chore.new
    @category = params[:category] if params[:category]
  end

  def create
    @space = Space.find(params[:space_id])
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
  end

  def show
    @chore = Chore.find(params[:id])
  end


  private

  def chore_params
    params.require(:chore).permit(:name, :due_date, :category, :description, :user_id)
  end

end
