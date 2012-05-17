class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :task_id, :null => false
      t.integer :user_id, :null => false
      t.text :body, :null => false
      t.timestamps
    end
    
    add_index :comments, :task_id, :user_id
  end
end
