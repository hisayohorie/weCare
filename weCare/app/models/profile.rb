class Profile < ActiveRecord::Base
  has_and_belongs_to_many :services
  has_many :reviews
  has_many :bookings
  belongs_to :user
  validates :user_id, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  def display_distance_to(user_location)
    self.distance_to(user_location, :km).round(2)
  end

end
