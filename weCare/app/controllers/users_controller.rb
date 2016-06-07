class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

def new
  @user = User.new
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
  @user = current_user
  if @user.update_attributes(user_params)
    redirect_to user_url(current_user)
  else
    render :edit
  end
end

def destroy
  @user = current_user
  @user.destroy

  if @user.profile
    @user.profile.destroy
  end
  session[:user_id] = nil
  redirect_to root_url
end

 private
 def user_params
   params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :photo)
 end
end
