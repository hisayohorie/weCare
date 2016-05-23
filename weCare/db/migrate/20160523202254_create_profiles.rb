class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :age
      t.string :description
      t.integer :exp_num
      t.string :education
      t.string :language
      t.string :availability
      t.integer :travel_propensity
      t.string :transportation
      t.boolean :pets

      t.timestamps null: false
    end
  end
end
