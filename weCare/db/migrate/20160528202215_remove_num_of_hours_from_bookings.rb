class RemoveNumOfHoursFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :num_of_hours, :integer
  end
end
