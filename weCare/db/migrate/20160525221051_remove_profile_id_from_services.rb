class RemoveProfileIdFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :profile_id, :integer
  end
end
