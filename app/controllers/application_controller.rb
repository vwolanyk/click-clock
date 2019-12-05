class ApplicationController < ActionController::Base
   before_action :authenticate_user!
   before_action :configure_permitted_parameters, if: :devise_controller?
   around_action :set_time_zone

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

# temporary - will save user time zone in future and use thats
  def set_time_zone
    Time.use_zone('Eastern Time (US & Canada)') { yield }
  end
end
