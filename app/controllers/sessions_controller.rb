class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:return_to]
        return_to = session[:return_to]
        session[:return_to] = nil
        redirect_to return_to, notice: "Logged in!"
      else
        redirect_to root_url, notice: "Logged in!"
      end
    else 
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
end
