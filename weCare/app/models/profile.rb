class Profile < ActiveRecord::Base
  has_many :services
  has_many :reviews
  has_one :user


  def display_distance_to(user)
    self.user.distance_to(user, :km).round(2)
  end

end
