class RemoveDateTimeFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :date_time, :datetime
  end
end
