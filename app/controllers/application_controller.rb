class ApplicationController < ActionController::Base
	protect_from_forgery

	helper_method :current_user, :logged_in?

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

  def logged_in?
    current_user != nil
  end

  def authorize
    if !(logged_in?)
        redirect_to root_url, :notice => "Sorry, man. Please log in to view this page!"
    else
      if !(current_user.admin)
        redirect_to root_url, :notice => "Sorry, man. You are not authorized to view this page!"
      end
    end
  end

end