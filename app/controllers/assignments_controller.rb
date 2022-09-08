class AssignmentsController < ApplicationController

  def new
    @assignment = Assignment.new
    @space = Space.find(params[:space_id])
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.space = Space.find(params[:space_id])


    if @assignment.save
      UserMailer.with(user: @assignment.user, space: @assignment.space).welcome_email.deliver_later
      redirect_to user_space_path(current_user, @assignment.space)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @assignment = Assignment.find(params[:id])
    @assignment.update(:accepted)
    redirect_to user_space_path(current_user, @space)
  end

  private
  def assignment_params
    params.require(:assignment).permit(:user_id, :accepted)
  end

end
