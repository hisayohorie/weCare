class RemoveLongitudeAndLatitudeFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :longitude, :float
    remove_column :profiles, :latitude, :float
  end
end
