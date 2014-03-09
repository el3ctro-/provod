class SessionsController < ApplicationController
  def new
 # user = User.find_by(name: params[:name])
 # if user and user.authenticate(params[:password])
 #   session[:user_id] = user_id
   user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
  
    else
	flash[:error] = 'Invalid email/password combination' # Not quite right!
    render 'new'
    end
  end

  def create
  end

  def destroy
  end
end
