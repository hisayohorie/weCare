
class ProfilesController < ApplicationController
  def index
      if params[:search]
        location = Geocoder.search(params[:search])
        location_result = location.first.geometry["location"]
        @lat = location_result["lat"]
        @lng = location_result["lng"]
        @distance = params[:distance]
        @nearby_profiles = Profile.near([@lat, @lng], params[:distance], units: :km)


      elsif params[:service_id] && params[:rate] && params[:distance] && params[:service_id]
        @lat = params[:latitude]
        @lng = params[:longitude]
        @distance = params[:distance]
        @nearby_profiles = Profile.near([@lat, @lng], params[:distance]).joins(:services).where("rate <= ?", params[:rate]).where(services: {id: params[:service_id]} )
        # @nearby_profiles = Profile.near([@lat, @lng]).joins(:services).where("rate <= ?", params[:rate])
        # Profile.near([@lat, @lng]).joins(:services).where("rate <= ?", params[:rate]).where(services: {id: params[:service_id]} )
         #Profile.joins(:services).where(services: {id: params[:service_id] } )
      elsif params[:latitude] && params[:longitude] && params[:distance]
         @lat = params[:latitude]
         @lng= params[:longitude]
         @distance = params[:distance]
         @nearby_profiles = Profile.near([@lat, @lng], params[:distance], units: :km)

      end
         respond_to do |format|
         format.html
         format.js
      end
  end


  def show
    @profile = Profile.find(params[:id])

    # @booking = @profile.bookings.last #maybe for testing?

    if current_user
      @review = @profile.reviews.build
    end

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
    params.require(:profile).permit(:user_id, :age, :description, :exp_num, :education, :language, :availability, :travel_propensity, :pets, :address, :rate, :phone_number, :transportation, :service_ids)

  end
end
