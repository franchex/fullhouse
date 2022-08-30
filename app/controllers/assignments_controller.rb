class AssignmentsController < ApplicationController

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.save
    redirect_to root_path
  end


  private
  def assignment_params
    params.require(:assignment).permit(:user_id, :space_id)
  end

end
