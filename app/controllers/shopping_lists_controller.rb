class ShoppingListsController < ApplicationController
  before_action :sets_space, only: [:new, :create, :destroy]

  def new
    @shopping_list = ShoppingList.new
  end

  def show
    @shopping_list = ShoppingList.find(params[:id])
  end

  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.space = @space
    if @shopping_list.save
      redirect_to user_space_path(current_user, @space)
    else
      flash[:alert] = "you dumb"
      redirect_to user_space_path(current_user, @space), status: :unprocessable_entity
    end
  end

  def destroy
    @shopping_list = ShoppingList.find(params[:id])
    @shopping_list.destroy
    redirect_to user_space_path(current_user, @space), status: :see_other
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:name)
  end

  def sets_space
    @space = Space.find(params[:space_id])
  end
end
