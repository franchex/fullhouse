class SpacesController < ApplicationController

  def show
    @space = Space.find(params[:id])
  end

  def create
    @space = Space.new(params[space_params])
    @space.save
    redirect_to root_path
  end

  def update
    @space = Space.find(params[:id])
    @space.update(space_params)
    redirect_to root_path
  end

  def destroy
    @space = Space.find(params[:id])
    @space.destroy
    redirect_to root_path
  end

  private

  def space
    params.require(:space).permit(:name)
  end
end
