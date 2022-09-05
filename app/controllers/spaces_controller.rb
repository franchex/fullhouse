class SpacesController < ApplicationController
  def new
    @space = Space.new
  end

  def show
    @space = Space.find(params[:id])
    @chores_categories = ["Bathroom", "Dishes", "Sweep", "Kitchen", "Trash",
      "Washer"]
    @expenses_categories = ["Restaurant", "Groceries", "Free Time", "Pets", "Drinks", "Party", "Gifts", "Service", "House"]
    @expenses_categories_icons = ["utensils", "cart-shopping", "gamepad", "paw", "martini-glass-citrus", "cake-candles", "gift", "taxi", "house"]
    @expenses = @space.expenses
    @bills = @space.bills
    @bills_categories = ["Electricity", "Waste", "Phone", "Gas", "Internet", "Rent"]
    @bills_categories_icons = ["lightbulb", "trash-can", "phone", "fire", "wifi", "house"]
    @chores = @space.chores
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

  def index
    @spaces = Space.all
  end

  private

  def space_params
    params.require(:space).permit(:name)
  end

end
