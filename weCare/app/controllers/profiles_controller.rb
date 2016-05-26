
class ProfilesController < ApplicationController


  def index

      @user_location = params[:search]
      if @user_location
        @location = Geocoder.search(@user_location)
        @location_result = @location.first.geometry["location"]
        @lat = @location_result["lat"]
        @lng = @location_result["lng"]


        @nearby_profiles = Profile.near([@lat, @lng], 7, units: :km)


      elsif params[:latitude] && params[:longitude]
         @latitude = params[:latitude]
         @longitude = params[:longitude]
         @nearby_profiles = Profile.near([@latitude, @longitude], 7, units: :km)

      # else
      #    @profiles = Profile.all
      end
         respond_to do |format|
         format.html
         format.js
      end
  end


  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      flash[:notice] = "Your profile is updated"
      redirect_to @profile
    else
      render :edit
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:user_id, :age, :description, :exp_num, :education, :language, :availability, :travel_propensity, :pets, :address)

  end
end
