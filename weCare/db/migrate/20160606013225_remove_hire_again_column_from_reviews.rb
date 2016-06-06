class RemoveHireAgainColumnFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :hire_again, :boolean
    add_column :reviews, :hire_again, :integer
  end
end
