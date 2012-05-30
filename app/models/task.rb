class Task < ActiveRecord::Base
  belongs_to :user
  
  has_many :events
  has_many :comment_events
  
  has_many :assignments
  has_many :users, :through => :assignments
  
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
      :events => self.events.limit(10),
      :users => self.users
    })
  end
end
