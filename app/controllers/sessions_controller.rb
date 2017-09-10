class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      # either user doesn't exist or wrong password sad path testing
    end
  end
end