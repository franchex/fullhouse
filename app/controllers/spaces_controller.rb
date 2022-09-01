class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :subscribe]
  def new
    @space = Space.new
  end

  def show
    @space = Space.find(params[:id])
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

  def space_params
    params.require(:space).permit(:name)
  end

  def set_user
    @user = current_user
  end
end
