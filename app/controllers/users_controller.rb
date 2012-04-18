class UsersController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!
  
  def assign
    assignment = Assignment.create :task_id => params[:task_id], :user_id => params[:id]
    respond_with(assignment.valid?)
  end
end
