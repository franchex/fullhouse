class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = current_user
  end

end
