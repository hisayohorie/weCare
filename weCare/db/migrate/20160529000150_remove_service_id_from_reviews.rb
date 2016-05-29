class RemoveServiceIdFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :service_id, :integer
    add_column :reviews, :profile_id, :integer
  end
end
