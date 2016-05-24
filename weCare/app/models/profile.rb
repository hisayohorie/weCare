class Profile < ActiveRecord::Base
  has_many :services
  has_many :reviews
  has_one :user
end
