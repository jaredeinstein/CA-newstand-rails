class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user 

	def current_user 
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] 
	end
  
  def require_login 
  	redirect_to login_path unless current_user 
	end
  
  def require_logout
    redirect_to root_path if current_user
  end
  
  def require_author
    redirect_to root_path unless current_user.author?
  end
  
  # Confirms the correct user.
  def correct_user
#    begin
#      @user = User.find(params[:id])
#    rescue ActiveRecord::RecordNotFound => e
#      @user = nil
#    end
#    redirect_to(edit_user_path(current_user)) unless current_user.current_user?(@user)
    redirect_to(edit_user_path(current_user)) unless current_user[:id].to_s == params[:id]
  end
      
end