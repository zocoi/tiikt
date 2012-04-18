class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  
  validates :user_id, presence: true
  validates :task_id, presence: true
end
