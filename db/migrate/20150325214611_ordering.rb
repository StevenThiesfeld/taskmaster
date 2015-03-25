class Ordering < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.rename :row_order, :row_ordering
    end
  end
end
