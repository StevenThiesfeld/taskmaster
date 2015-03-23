class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :title
      t.text :body
      t.integer :user_id
      t.integer :created_by
      t.integer :project_id
      t.text :priority
      t.text :status

      t.timestamps
    end
  end
end
