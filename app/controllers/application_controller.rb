class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def authenticate_user!
    if current_user
      true
    else
      session[:return_to] = request.url
      redirect_to login_path
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
   
  helper_method :current_user
  
end