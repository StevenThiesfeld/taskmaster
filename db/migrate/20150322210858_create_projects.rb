class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :name
      t.text :status
      t.datetime :time_closed
      t.integer :creator_id

      t.timestamps
    end
  end
end
