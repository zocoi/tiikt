class TasksController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  def index
    respond_with(@tasks = current_user.tasks)
  end
  
  def show
    respond_with current_user.tasks.find(params[:id])
  end
  
  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      respond_with(@task)
    else
      respond_with(@task, :status => :unprocessable_entity)
    end
  end
  
  def update
    puts params.inspect
    respond_with Task.update(params[:id], params[:task])
  end
  
  def destroy
    respond_with Task.destroy(params[:id])
  end
end