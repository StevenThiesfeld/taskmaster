class TaskNum < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.integer :task_number
    end
  end
end
