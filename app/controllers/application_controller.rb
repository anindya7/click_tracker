class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :track_action
  Ahoy.cookie_domain = :all
  Ahoy.visit_duration = 2.minutes
  protected

  def track_action
    if ahoy.visit
      ahoy.track "Viewed #{controller_path}##{action_name}", params: request.path_parameters
    end
  end
  
end
