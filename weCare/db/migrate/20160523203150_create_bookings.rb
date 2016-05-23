class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.datetime :date_time
      t.string :address
      t.integer :num_of_hours

      t.timestamps null: false
    end
  end
end
