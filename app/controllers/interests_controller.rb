class InterestsController < ApplicationController

  def new
    @interest = Interest.new
    @organiser = current_organiser
  end

  def create
    @organiser = current_organiser
    @interest = Interest.new(interest_params)
    @organiser.interests << @interest
    @interest.save!
    @organiser.save!
    redirect_to organiser_profile_path(@organiser)
  end

  private
  def interest_params
    params.require(:interest).permit(:tag)
  end
end
