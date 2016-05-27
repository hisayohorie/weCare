class Booking < ActiveRecord::Base
  has_one :review
  belongs_to :profile
  belongs_to :user

  validates :date_time, :address, :num_of_hours, presence:true
  validate :valid_date_range, :future_date_only

  def valid_date_range
      if !date_time.blank? && date_time> Date.today + 30.days
        errors.add(:date_time, "Bookings can only be made 10 days in advance.")
      end
    end

  def future_date_only
      if !date_time.blank? && date_time <= Date.today
        errors.add(:date_time, "Bookings can only be made for a later than today's date.")
      end
    end





end
