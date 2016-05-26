class AddRateToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :rate, :integer
  end
end
