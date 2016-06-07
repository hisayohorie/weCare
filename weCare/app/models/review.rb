class Review < ActiveRecord::Base
  belongs_to :profile
  belongs_to :user

  validate :troller_prevention

  def troller_prevention
    reviewer = self.user
    relevant_bookings = reviewer.bookings.where(profile_id: self.profile_id)
    if relevant_bookings.length <= 0
      errors.add(:profile_id, "You never worked with this robot, to write a review, book an appointment!.")
    end
  end


end
