class ReviewsController < ApplicationController
  before_action :load_profile
    def show
      @review = Review.find(params[:id])
    end

    def create
      @review = @profile.reviews.build(review_params)
      @review.user = current_user
      if @review.save
        redirect_to profiles_url, notice: 'Thank you for your review!'
      else
        render 'profiles/show'
      end
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
