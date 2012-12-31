class SessionsController < ApplicationController
  def new
  end

  def create
    #render text: params.to_yaml
    user = User.find_by_email(params[:user_identifier])
    user ||= User.find_by_username(params[:user_identifier])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      redirect_to log_in_path, notice: "Invalid Email/Username or Password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end