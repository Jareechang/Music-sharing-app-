class SessionsController < ApplicationController

  # creates or finds User's successful OAuth Login 
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  # Destroys the User session when logging out 
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end