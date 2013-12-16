class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(participant)
    participant_path(current_participant)
  end

  def after_sign_in_path_for(organiser)
    organiser_path(current_organiser)
  end

  def after_sign_out_path_for(participant)
    root_path
  end

  def after_sign_out_path_for(organiser)
    root_path
  end

  protected 
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name]

    devise_parameter_sanitizer.for(:organiser_events) << [:"start_date(1i)", :"start_date(2i)", :"start_date(3i)", :"start_date(4i)", :"start_date(5i)"]
  end

end
