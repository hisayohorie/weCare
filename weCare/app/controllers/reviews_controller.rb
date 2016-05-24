class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end


  def new
    @review = Review.new
  end

  def create
    if current_user
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    @review.booking_id = @booking.id
    if @review.save
      flas[:notice] = "Review is succesfully created"
      redirect_to :review
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if current_user
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to @review
    else
      render :edit
    end
  end


  def destroy
    if current_user
    @review = Review.find(params[:id])
    @review.destroy
  end
end

private
def review_params
  params.require(:review).permit(:service_id, :user_id, :descreption, :star_rating, :dependability, :pancutuarity, :reliable_transportation, :hire_again)
end
