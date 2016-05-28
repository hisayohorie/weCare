class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
 def new
   @user = User.new
 end

 def create
   if @user = login(params[:email], params[:password])
     redirect_back_or_to root_url
   else
     @user = User.new
     flash.now[:alert] = 'E-mail and/or password is incorrect.'
     render 'new'
   end
 end

 def destroy
  #  logout
  #  flash[:success] = 'See you!'
  #  redirect_to log_in_path
  session[:user_id] = nil
  redirect_to root_url, notice: "Logged out!"
 end
end
