class RemoveServiceTypeFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :infant_care 
    remove_column :services, :toddler_care
    remove_column :services, :tween_care
    remove_column :services, :teenage_care
  end
end
