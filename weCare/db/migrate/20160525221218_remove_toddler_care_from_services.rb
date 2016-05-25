class RemoveToddlerCareFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :toddler_care, :boolean
  end
end
