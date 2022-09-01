class ChoresController < ApplicationController

  def new
    @space = Space.find(params[:space_id])
    @chore = Chore.new
    @category = params[:category] if params[:category]
  end


  def show
    @chore = Chore.find(params[:id])
  end

  def create
    @space = Space.find(params[:space_id])
    @chore = Chore.new(chore_params)

    raise
    @chore.space = @space
    if @chore.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @chore = Chore.find(params[:id])
    @chore.update(chore_params)
    redirect_to root_path
  end


  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy
    redirect_to root_path
  end



  private

  def chore_params
    params.require(:chore).permit(:name, :due_date, :category, :description, :user_id)
  end

end
