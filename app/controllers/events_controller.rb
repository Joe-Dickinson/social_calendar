class EventsController < ApplicationController

  def new
    @event = Event.new
    @event.organiser = current_organiser
  end

  def create
    @event = Event.new(event_params)
    @event.organiser = current_organiser
    @event.save!
    redirect_to organiser_path(current_organiser)
  end

  def index

  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :url, :organiser_id)
  end
end
