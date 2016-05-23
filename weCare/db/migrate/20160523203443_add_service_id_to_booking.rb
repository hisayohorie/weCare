class AddServiceIdToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :service_id, :integer
  end
end
