class ShoppingListsController < ApplicationController
  def show
    @shoppinglist = ShoppingList.find(params[:id])
  end

  def create
    @shoppinglist = ShoppingList.new(params[shoppinglist_params])
    @shoppinglist.save
    redirect_to root_path
  end

  def update
    @shoppinglist = ShoppingList.find(params[:id])
    @shoppinglist.update(shoppinglist_params)
    redirect_to root_path
  end

  def destroy
    @shoppinglist = ShoppingList.find(params[:id])
    @shoppinglist.destroy
    redirect_to root_path
  end

  private

  def shoppinglist_params
    params.require(:shoppinglist).permit(:name)
  end
end
