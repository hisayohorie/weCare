class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_one :profile
  has_many :bookings

  geocoded_by :address
  after_validation :geocode

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address


  validates :password, length: { minimum: 4 }
  validates :password, confirmation: true
  validates :email, uniqueness: true, email_format: { message: 'has invalid format' }
end
