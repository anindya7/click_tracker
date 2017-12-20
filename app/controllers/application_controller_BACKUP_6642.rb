class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :track_action

  protected

  def track_action
<<<<<<< HEAD
    # if ahoy.visit
    #   ahoy.track_visit
    # end
=======
    if ahoy.visit
      ahoy.track "Viewed #{controller_path}##{action_name}", params: request.path_parameters
    end
>>>>>>> c74bd9a1a56ae1d319ebe35b25ac7b1a061a52ec
  end
  
end
