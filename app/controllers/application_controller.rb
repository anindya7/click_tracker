class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :track_action

  protected

  def track_action
    # if ahoy.visit
    #   ahoy.track_visit
    # end
  end
  
end
