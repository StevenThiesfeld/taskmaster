class ChangeProject < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.rename :creator_id, :user_id
    end
  end
end
