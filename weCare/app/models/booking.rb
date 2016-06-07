class Booking < ActiveRecord::Base
  has_one :review
  belongs_to :profile
  belongs_to :user

  validates :address, :start_time, :end_time, :user_id, :profile_id, presence:true
  validate :valid_date_range, :future_date_only, :valid_time_range, :sitter_available?

  def valid_date_range
      if !start_time.blank? && start_time> Date.today + 30.days
        errors.add(:start_time, "Bookings can only be made 10 days in advance.")
      end
    end
    def valid_time_range
      if !start_time.blank? && !end_time.blank? && start_time >= end_time
        errors.add(:end_time, " we can't go to the past")
     end
    end

  def future_date_only
      if !start_time.blank? && start_time <= Date.today
        errors.add(:start_time, "Bookings can only be made for a later than today's date.")
      end
    end
  def sitter_available?
      #does the sitter/profile have any bookings?
      other_bookings = profile.bookings.where("((start_time <= ? and end_time >= ?) or (start_time <= ? and end_time >= ?)) and
      (confirmation = ?) and (id != ?)",
      self.start_time, self.start_time, self.end_time, self.end_time, true, self.id)
      if other_bookings.any?
      errors.add(:start_time, "the care giver is not available that time")

    end
  end


    # def sitter_available?
    # #does the sitter/profile have any bookings?
    # sitter_bookings = self.profile.bookings.where("some SQL code here") # I need a profile_id to test this
    # # if so what is the date_time of the booking? how long(num_of_hours)?
    #   if sitter_bookings.any?
    #     sitter_bookings.each do |s|
    #       #compare
    #       if s.date_time == self.date_time ||
    #       errors.add("Sorry the caregiver has other appointment that time. ")
    #       return
    #       end
    #     end
    #   end



end
