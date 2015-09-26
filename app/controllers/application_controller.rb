class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user 

	def current_user 
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] 
	end
  
  def require_user 
  	redirect_to login_path unless current_user 
	end
  
  def already_login
    redirect_to root_path if current_user
  end
  
  def current_user?(user)
    user == current_user
  end
      
end