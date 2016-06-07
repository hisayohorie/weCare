class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_one :profile
  has_many :bookings
  has_many :reviews

  validates :password, length: { minimum: 4 }, if: "password.present?"
  validates :password, confirmation: true, if: "password.present?"
  validates :email, uniqueness: true, email_format: { message: 'has invalid format' }
end
