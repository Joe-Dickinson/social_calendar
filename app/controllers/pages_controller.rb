class PagesController < ApplicationController

  def home 
    redirect_to new_organiser_session_path
  end
  
end
