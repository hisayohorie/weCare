class AddCategoriesToServices < ActiveRecord::Migration
  def change
    add_column :services, :category, :string
  end
end
