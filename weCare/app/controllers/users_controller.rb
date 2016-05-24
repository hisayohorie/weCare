class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

def index
  @users = User.all
end

def new
  @user = User.new
end

def index
  @users = User.all
end
 def create
   @user = User.new(user_params)
   if @user.save
     login(params[:user][:email], params[:user][:password])
     redirect_to root_path
   else
     render 'new'
   end
 end

 def show
   @user = User.find(params[:id])
 end

def edit
  @user = User.find(current_user)
end

def update
  @user = User.find(current_user)
  if @user.update_attributes(user_params)
    redirect_to current_user
  else
    render :edit
  end
end

 private
 def user_params
   params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :photo)
 end
end
