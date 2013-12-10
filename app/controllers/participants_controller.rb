class ParticipantsController < ApplicationController

  before_filter :authenticate_participant!

  def new 
    @participant = Participant.new
  end

  def index
    @participant_1 = Participant.find_by_id(params[:id])
    @participant = Participant.new
    redirect_to :action => 'show', :id => current_participant
  end

  #users should only ever see their own event feed. Event feed link should always be 
  #relevant to the currently logged in user
  def show
    @participant = current_participant 
    # @participant = Participant.find(params[:id])
    @events = Event.all
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
