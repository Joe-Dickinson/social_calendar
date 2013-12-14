class OrganisersController < ApplicationController

  before_filter :authenticate_organiser! 

  def index
    @organiser = current_organiser
  end

  def show
    @events = Event.all
    @events = @events.order(:created_at => :desc)
    @organiser = current_organiser
  end

  def edit
    @organiser = Organiser.find(params[:id])
  end

  def profile 
    @organiser = Organiser.find(params[:id])
  end

  def update
    @organiser = Organiser.find(params[:id])
    @organiser.update_attributes(profile_params)
    redirect_to organiser_profile_path(@organiser)
  end

  def join
    @organiser = Organiser.find(params[:organiser_id])
    @event = Event.find(params[:event_id])
    @organiser.add_to_event(@organiser, @event)
    redirect_to organiser_path(@organiser)
    flash[:notice] = "You are attending #{@event.title}!"
  end

  def cancel
    @organiser = Organiser.find(params[:organiser_id])
    @event = Event.find(params[:event_id])
    @organiser.remove_from_event(@organiser, @event)
    redirect_to organiser_path(@organiser)
    flash[:notice] = "You are no longer attending #{@event.title}."
  end

  private
  def profile_params
    params.require(:organiser).permit(:name)
  end
end
