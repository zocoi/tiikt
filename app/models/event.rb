class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :task
  belongs_to :user
  
  def as_json options={}
    super(options).merge({
      :user => self.user
    })
  end
  
end
