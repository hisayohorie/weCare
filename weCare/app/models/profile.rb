class Profile < ActiveRecord::Base
  has_many :services
  has_many :reviews
  has_one :user

  def display_distance_to(profile)
     self.user.distance_to(profile, :km).round(2)
   end

  # def display_distance_to(params[:search])
  #   self.user.distance_to(params[:search], :km).round(2)
  # end

end
