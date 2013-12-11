class PagesController < ApplicationController

  def home 
    if organiser_signed_in? 
      redirect_to organiser_path(current_organiser)
    end

    if participant_signed_in?
      redirect_to participants_path(current_participant)
    end
  end
  
end
