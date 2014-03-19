class SessionsController < ApplicationController
  def new
 # user = User.find_by(name: params[:name])
 # if user and user.authenticate(params[:password])
 #   session[:user_id] = user_id

  end

	# POST TO create
  def create
   user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      sign_in user
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
