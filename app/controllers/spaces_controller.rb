class SpacesController < ApplicationController
  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @assignment = Assignment.new
    @assignment.user = current_user
    @assignment.space = @space
    if @space.save
      @assignment.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @space = Space.find(params[:id])
  end

  def index
    @spaces = Space.all
  end

  private

  def space_params
    params.require(:space).permit(:name)
  end

end
