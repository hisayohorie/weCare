class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :profile_id
      t.boolean :infant_care
      t.boolean :toddler_care
      t.boolean :tween_care
      t.boolean :teenage_care

      t.timestamps null: false
    end
  end
end
