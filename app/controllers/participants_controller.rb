class ParticipantsController < ApplicationController

  # before_filter :authenticate_user!

  def new 
    @participant = Participant.new
  end

end
