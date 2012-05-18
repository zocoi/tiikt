class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  
  has_many :events
  has_many :comment_events
  
  validates :description, :presence => true
  
  attr_accessor :is_completed
  
  def is_completed
    self.completed_at != nil
  end
  
  def is_completed= value
    if value
      self.completed_at = Time.now
    else
      self.completed_at = nil
    end
  end
  
  def as_json options={}
    super(options).merge({
      :is_completed => self.is_completed,
      :due_at => (self.due_at)?self.due_at.to_date.iso8601 : nil,
      :events => self.events
    })
  end
end
