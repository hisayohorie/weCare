
class ProfilesController < ApplicationController


  def index

      @user_location = params[:search]
      if @user_location
        @location = Geocoder.search(@user_location)
        @location_result = @location.first.geometry["location"]
        @lat = @location_result["lat"]
        @lng = @location_result["lng"]
        @nearby_profiles = Profile.near([@lat, @lng], 7, units: :km)

        if params[:services] && params[:rate]

          serviceProfile = Service.find(params[:service_id]).profiles
              @nearby_profiles = serviceProfile.where("rate < ?", params[:rate])
              @nearby_profiles.each do |p|
                p.rate
              end
        end

      elsif params[:latitude] && params[:longitude] && params[:distance]
         @latitude = params[:latitude]
         @longitude = params[:longitude]

         @nearby_profiles = Profile.near([@latitude, @longitude], @distance, units: :km)

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
    @user = current_user
    @profile = @user.build_profile(profile_params)

    if @profile.save
      redirect_to profile_path(@profile)
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
    params.require(:profile).permit(:user_id, :age, :description, :exp_num, :education, :language, :availability, :travel_propensity, :pets, :address, :rate, :phone_number, :transportation)

  end
end
