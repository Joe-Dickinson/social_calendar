class OrganisersController < ApplicationController

  before_filter :authenticate_organiser! 

  def index
    @organiser = current_organiser
  end

  def show
    @organiser = current_organiser
  end
end
