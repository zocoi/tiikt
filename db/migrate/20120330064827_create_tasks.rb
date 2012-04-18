class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer   :user_id, :null => false
      
      t.string    :description
      
      t.timestamp :due_at
      t.timestamp :completed_at
      t.timestamps
    end
  end
end
