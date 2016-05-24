class RemoveAddressFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :address, :string
  end
end
