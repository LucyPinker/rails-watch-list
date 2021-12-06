class Removelistsid < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :lists, null: false, foreign_key: true
  end
end
