class AddInfantCareToServices < ActiveRecord::Migration
  def change
    add_column :services, :infant_care, :string
  end
end
