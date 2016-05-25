class RemoveTeenageCareFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :teenage_care, :boolean
  end
end
