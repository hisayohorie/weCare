class AddToddlerCareToServices < ActiveRecord::Migration
  def change
    add_column :services, :toddler_care, :string
  end
end
