class Booking < ActiveRecord::Base
  has_one :review
  belongs_to :profile
  belongs_to :user

  validates :date_time, :address, :num_of_hours, :user_id, :profile_id, presence:true
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

    def sitter_available?
    #does the sitter/profile have any bookings?
    sitter_bookings = self.profile.bookings.where("some SQL code here") # I need a profile_id to test this
    # if so what is the date_time of the booking? how long(num_of_hours)?
      if sitter_bookings.any?
        sitter_bookings.each do |s|
          #compare
          if s.date_time == self.date_time ||
          errors.add("Sorry the caregiver has other appointment that time. ")
          return
          end
        end
      end
    end

    def sitter_confirmation
    end
