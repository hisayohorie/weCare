class RemoveTweenCareFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :tween_care, :boolean
  end
end
