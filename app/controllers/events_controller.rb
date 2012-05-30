class EventsController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def index
    respond_with(@events = current_user.events)
  end
  
  def create
    @event = current_user.events.build(params[:event])
    if @event.save
      respond_with(@event)
    else
      respond_with(@event, :status => :unprocessable_entity)
    end
  end
  
  def update
    respond_with Event.update(params[:id], params[:event])
  end
  
  def destroy
    respond_with Event.destroy(params[:id])
  end
end

