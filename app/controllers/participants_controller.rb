class ParticipantsController < ApplicationController

  before_filter :authenticate_participant!

  def new 
    @participant = Participant.new
  end

  def index
    @participant = Participant.new 
    redirect_to :action => 'show', :id => current_participant 
  end

  def show
    @participant = current_participant 
    @events = Event.all
    @events = @events.reverse
  end

  def profile
    @participant = Participant.find(params[:id])
  end

  def edit
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])
    @participant.update_attributes(profile_params)
    redirect_to participant_profile_path(@participant)
  end

  private
  def profile_params
    params.require(:participant).permit(:name)
  end

end
