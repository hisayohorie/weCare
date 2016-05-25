class AddTeenageCareToServices < ActiveRecord::Migration
  def change
    add_column :services, :teenage_care, :string
  end
end
