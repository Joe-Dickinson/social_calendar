class EventsController < ApplicationController

  def new
    @event = Event.new
    @event.organiser = current_organiser
  end

  def create
    @event = Event.new(event_params) 
    @event.save!
    redirect_to organiser_path(current_organiser)
  end

  def index
    
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :url, :organiser_id)
  end
end
