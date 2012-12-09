class ApplicationController < ActionController::Base
  protect_from_forgery

before_filter :set_current_user

  def set_current_user
    User.current_user = current_user
  end
  
rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.root_url, :alert => exception.message
end


end
