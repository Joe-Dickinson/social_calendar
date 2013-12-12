class OrganisersController < ApplicationController

  before_filter :authenticate_organiser! 

  def index
    @organiser = current_organiser
  end

  def show
    @events = Event.all
    @events = @events.reverse
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

  private
  def profile_params
    params.require(:organiser).permit(:name)
  end
end
