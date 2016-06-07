class GiveConfirmationDefaultValue < ActiveRecord::Migration
  def change
    change_column :bookings, :confirmation, :boolean, default: false
  end
end
