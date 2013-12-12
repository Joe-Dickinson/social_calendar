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

  def profile 
    @organiser = Organiser.find(params[:id])
  end
end
