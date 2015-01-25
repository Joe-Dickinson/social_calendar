class AdminController < ApplicationController

  def index
    @organisers = Organiser.all
  end

end