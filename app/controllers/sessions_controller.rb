class SessionsController < ApplicationController
 def new
   if logged_in? == true
      redirect_to root_path
    end
  end

  def create
    if logged_in? == true
      redirect_to root_path
    end
  	user = User.find_by(email: params[:session][:email])
  	if user and user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to user
  	else
  		flash.now[:danger] = 'Invalid password or username' 
  		render 'new'

  	end
  end

  def destroy
  	log_out
  	redirect_to root_path
  end
end
