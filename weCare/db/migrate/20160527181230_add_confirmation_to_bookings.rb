class AddConfirmationToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :confirmation, :boolean
  end
end
