class CreateJoinTableProfilesServices < ActiveRecord::Migration
  def change
    create_join_table :profiles, :services do |t|
      # t.index [:profile_id, :service_id]
      # t.index [:service_id, :profile_id]
    end
  end
end
