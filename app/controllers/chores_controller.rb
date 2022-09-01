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
    @chore = Chore.new(params[chore_params])
    @chore.space = @space
    @chore.user = current_user
    @chore.save
    redirect_to root_path
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
    params.require(:chore).permit(:name, :due_date)
  end

end
