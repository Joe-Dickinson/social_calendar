class InterestsController < ApplicationController

  def new
    @interest = Interest.new
    @organiser = current_organiser
  end

  def create
    @organiser = current_organiser
    @interest = Interest.new(interest_params)
    if @interest.organiser_has_interest(@organiser) == true
      flash[:alert] = "You already have this interest!"
    else
      @interest = @interest.interest_exists
      if @interest == nil
        @interest = Interest.new(interest_params)
        @organiser.interests << @interest
        @interest.save!
        @organiser.save!
        flash[:success] = "New interest created."
      else
        @organiser.interests << @interest
        @organiser.save!
        flash[:success] = "Existing interest added."
      end
    end
    redirect_to organiser_profile_path(@organiser)
  end

  def remove
    @organiser = current_organiser
    @interest = current_organiser.interests.find(params[:id])
    if @interest.organisers.count <= 1
      @interest.destroy!
      @organiser.save!
      flash[:success] = "No more fans. Interest deleted."
    else
      @like = @organiser.likes.find_by_interest_id(params[:id])
      @like.destroy!
      flash[:success] = "Interest removed."
    end
    redirect_to organiser_profile_path(@organiser)
  end

  private
  def interest_params
    params.require(:interest).permit(:tag)
  end
end
