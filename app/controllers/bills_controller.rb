class BillsController < ApplicationController
  before_action :sets_space, only: [:new, :create, :destroy]

  def new
    @bill = Bill.new
    @category = params[:category] if params[:category]
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.space = @space
    if @bill.save
      redirect_to user_space_path(current_user, @space)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @bill = Bill.find(params[:id])
    @bill.update(bill_params)
    redirect_to root_path
  end

  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to user_space_path(current_user, @space), status: :see_other
  end

  private

  def bill_params
    params.require(:bill).permit(:due_date, :category, :amount, :user_id)
  end

  def sets_space
    @space = Space.find(params[:space_id])
  end
end
