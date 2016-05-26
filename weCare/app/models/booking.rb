class Booking < ActiveRecord::Base
  has_one :review
  belongs_to :profile
  belongs_to :user
end
