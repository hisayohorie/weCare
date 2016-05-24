class Booking < ActiveRecord::Base
  has_one :review
  belongs_to :user
  has_one :profile, through: :user
end
