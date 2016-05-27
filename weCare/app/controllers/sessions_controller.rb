class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

 def new
   @user = User.new
 end

 def create
   user = User.find_by(email: params[:email])
   if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect_to root_path, notice: "Logged in!"
   else
     flash.now[:alert] = "Invalid email or password"
     render "new"
   end

  #  if login(params[:email], params[:password])
  #    flash[:success] = 'Welcome back!'
  #    redirect_back_or_to root_path
  #  else
  #    flash.now[:warning] = 'E-mail and/or password is incorrect.'
  #    render 'new'
  #  end
end

 def destroy
  #  logout
  #  flash[:success] = 'See you!'
  #  redirect_to log_in_path
  session[:user_id] = nil
  redirect_to root_url, notice: "Logged out!"
 end
end
