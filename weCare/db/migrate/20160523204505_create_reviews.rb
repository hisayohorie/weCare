class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :service_id
      t.integer :user_id
      t.string :description
      t.integer :star_rating
      t.integer :dependability
      t.integer :punctuality
      t.integer :reliable_transportation
      t.boolean :hire_again

      t.timestamps null: false
    end
  end
end
