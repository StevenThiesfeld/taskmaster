class AddOrder < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.integer :row_order
    end
  end
end
