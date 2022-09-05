class BillsController < ApplicationController
  def new
    @bill = Bill.new
    @space = Space.find(params[:space_id])
    @category = params[:category] if params[:category]
  end

  def show
    @bill = Bill.find(params[:id])
  end


  def create
    @space = Space.find(params[:space_id])
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
    redirect_to root_path
  end

  private

  def bill_params
    params.require(:bill).permit(:name, :due_date, :category, :amount, :user_id)
  end
end
