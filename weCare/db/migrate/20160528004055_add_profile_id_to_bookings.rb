class AddProfileIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :profile_id, :integer
  end
end
