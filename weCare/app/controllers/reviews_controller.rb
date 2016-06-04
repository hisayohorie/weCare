class ReviewsController < ApplicationController
  before_action :load_profile
    def show
      @review = Review.find(params[:id])
      @reviewer = self.user
      # @relevant_bookings = reviewer.bookings.where(profile_id: self.profile_id)
    end

    def create
      @review = @profile.reviews.build(review_params)
      @review.user = current_user
      if @review.save
        redirect_to profile_url(@profile), notice: 'Thank you for your review!'
      else
        render 'profiles/show'
      end
    end

    def get_form
      @review = Review.new
      render partial: 'reviews/review_form' if current_user
    end

    def show_form
      @profile = Profile.find(params[:profile_id])
      @reviews = @profile.reviews
      render partial: 'reviews/show_reviews'
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
    end

  private
  def review_params
    params.require(:review).permit(:service_id, :user_id, :description, :star_rating, :dependability, :pancutuarity, :reliable_transportation, :hire_again)
  end

  def load_profile
    @profile = Profile.find(params[:profile_id])
  end
end
