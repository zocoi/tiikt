class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :task_id
      t.integer :user_id
    end
    
    add_index :assignments, :user_id
    add_index :assignments, :task_id
    add_index :assignments, [:user_id, :task_id], :unique => true
  end
end
