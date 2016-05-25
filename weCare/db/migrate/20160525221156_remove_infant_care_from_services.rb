class RemoveInfantCareFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :infant_care, :boolean
  end
end
