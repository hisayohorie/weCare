class AddTweenCareToServices < ActiveRecord::Migration
  def change
    add_column :services, :tween_care, :string
  end
end
