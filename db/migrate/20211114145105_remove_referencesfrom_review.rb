class RemoveReferencesfromReview < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :movie, null: false, foreign_key: true
  end
end
