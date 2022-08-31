class BillsController < ApplicationController
  def show
    @bill = Bill.find(params[:id])
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(params[bill_params])
    @bill.save
    redirect_to root_path
  end

  def update
    @bill = Bill.find(params[:id])
    @bill.update(bill_params)
    redirect_to root_path
  end

  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to root_path
  end

  private

  def bill_params
    params.require(:bill).permit(:name, :due_date)
  end
end
