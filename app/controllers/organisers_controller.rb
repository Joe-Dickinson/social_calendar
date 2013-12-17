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
    @interest = Interest.new
    @interests = Interest.all
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
    if request.referer == recommended_url(@organiser)
      redirect_to recommended_path(@organiser)
    else
      redirect_to organiser_path(@organiser)
    end
    flash[:notice] = "You are attending #{@event.title}!"
  end

  def cancel
    @organiser = Organiser.find(params[:organiser_id])
    @event = Event.find(params[:event_id])
    @organiser.remove_from_event(@organiser, @event)
    redirect_to organiser_path(@organiser)
    flash[:notice] = "You are no longer attending #{@event.title}."
  end

  def similar
    @organiser = Organiser.find(params[:id])
    @similar = @organiser.organisers.likeminded(@organiser.happenings.first)
  end

  def recommended
    @organiser = Organiser.find(params[:id])
    @recommended = @organiser.recommended_events
  end

  private
  def profile_params
    params.require(:organiser).permit(:name, :bio)
  end
end
