class OrganisersController < ApplicationController

  before_filter :authenticate_organiser! 

  def index
    @organiser = current_organiser
  end

  def show
    @events = Event.paginate(:page => params[:page], :per_page => 5, :order => "start_date DESC")
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
    @similar = @organiser.get_similar
  end

  def recommended
    @organiser = Organiser.find(params[:id])
    @recommended = @organiser.recommended_events
  end

  def hosting 
    @organiser = Organiser.find(params[:id])
  end

  def today
    @organiser = current_organiser
    @events = Event.where("start_date > ? AND start_date < ?", Time.now.midnight, Date.tomorrow.midnight.to_datetime).paginate(:page => params[:page], :per_page => 5, :order => "start_date ASC")
    render "organisers/show"
  end

  def tomorrow
    @organiser = current_organiser
    @events = Event.where("start_date > ? AND start_date < ?", Date.tomorrow.midnight, (Date.tomorrow+1).midnight.to_datetime).paginate(:page => params[:page], :per_page => 5, :order => "start_date ASC")
    render "organisers/show"
  end

  def this_week
    @organiser = current_organiser
    @events = Event.where("start_date > ? AND start_date < ?", Date.today.midnight, (Date.tomorrow+7).midnight.to_datetime).paginate(:page => params[:page], :per_page => 5, :order => "start_date ASC")
    render "organisers/show"
  end

  def next_week
    @organiser = current_organiser
    @events = Event.where("start_date > ? AND start_date < ?", (Date.today.midnight+7), (Date.tomorrow+14).midnight.to_datetime).paginate(:page => params[:page], :per_page => 5, :order => "start_date ASC")
    render "organisers/show"
  end

  def past
    @organiser = current_organiser
    @events = Event.where("start_date < ?", Date.today.midnight).paginate(:page => params[:page], :per_page => 5, :order => "start_date ASC")
    render "organisers/show"
  end

  def going_to
    @organiser = current_organiser
    @events = @organiser.happenings
  end

  private
  def profile_params
    params.require(:organiser).permit(:name, :bio, :image_url)
  end
end
