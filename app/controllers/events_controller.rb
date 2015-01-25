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
    @events = Event.paginate(:page => params[:page], :per_page => 5, :order => "start_date ASC")
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to organiser_event_path, notice: "Your event was updated"
    else
      render edit_organiser_event(@event.organiser, @event)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    redirect_to organiser_path(current_organiser), alert: "Your event was deleted."
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :url, :organiser_id, :"start_date(1i)", :"start_date(2i)", :"start_date(3i)", :"start_date(4i)", :"start_date(5i)", :image_url)
  end
end
