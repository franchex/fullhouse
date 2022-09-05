class ExpensesController < ApplicationController
  before_action :sets_space, only: [:new, :create, :destroy]
  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
    @category = params[:category] if params[:category]
  end

  def create
    @expense = Expense.new(expense_params)
    @category = params[:category] if params[:category]
    @expense.space = @space
    if @expense.save
      redirect_to user_space_path(current_user, @space)
    else
      render :new, status: :unprocessable_entity, category: @category
    end
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)
    redirect_to root_path
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to user_space_path(current_user, @space), status: :see_other
  end


  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category, :user_id)
  end

  def sets_space
    @space = Space.find(params[:space_id])
  end
end
