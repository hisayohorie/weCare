class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_one :profile
  has_many :bookings
  

  validates :password, length: { minimum: 4 }
  validates :password, confirmation: true
  validates :email, uniqueness: true, email_format: { message: 'has invalid format' }
end
