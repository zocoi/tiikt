class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :task
  belongs_to :user
end
