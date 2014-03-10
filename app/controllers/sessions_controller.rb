class SessionsController < ApplicationController
  def new
 # user = User.find_by(name: params[:name])
 # if user and user.authenticate(params[:password])
 #   session[:user_id] = user_id

  end

  def create
   user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      sign_in user
	  session[:user_id] = user.id
	  session[:user_name] = user.name
	  redirect_to :root #this was redirecting to user
    else
	flash.now[:error] = 'Invalid username or password.  Try again.' # Not quite right!
    render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
	end
end
