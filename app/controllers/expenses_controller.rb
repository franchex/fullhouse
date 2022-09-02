class ExpensesController < ApplicationController
  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @space = Space.find(params[:space_id])
    @chore = Expense.new
    @category = params[:category] if params[:category]
  end


  def create
    @expense = Expense.new(params[expense_params])
    @expense.save
    redirect_to root_path
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)
    redirect_to root_path
  end

  def destroy
    @expense = Expense.find(params[:id])
    @Expense.destroy
    redirect_to root_path
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
