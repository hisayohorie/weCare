class BookingsController < ApplicationController
  # before_action :ensure_logged_in

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @booking = @profile.bookings.build(booking_params)
    @booking.user = current_user

      if @booking.save
        redirect_to user_path(current_user), notice: "Booking created successfully!"
        if request.xhr?
          render partial: 'bookings/booking_confirm'
        end
      else

        # redirect_to profile_booking_url(@profile, @booking)
        render 'new'
      end

    # if current_user
    #   @booking = Booking.new
    #     if @booking.save
    #       redirect_to @booking
    #     else
    #       render :new, alert: "Please login."
    #     end
    # end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update_attributes(booking_params)
      flash[:notice]= "booking confirmed"
      redirect_to profile_booking_url
    else
      render :show
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_url
  end

private

def booking_params
  params.require(:booking).permit(:user_id, :start_time, :end_time, :address, :service_id)
end
end
