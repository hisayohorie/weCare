class BookingsController < ApplicationController
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
    if current_user
      @booking = Booking.new
        if @booking.save
          redirect_to @booking
        else
          render :new, alert: "Please login."
        end
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if current_user
      if @booking.update_attributes(booking_params)
        redirect_to @booking
      else
        render :edit
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

private

def booking_params
  params.require(:booking).permit(:user_id, :date_time, :address, :num_of_hours, :service_id)
end
end
