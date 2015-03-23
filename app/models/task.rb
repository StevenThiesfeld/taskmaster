class Task < ActiveRecord::Base
  attr_accessible :body, :created_by, :priority, :project, :status, :title, :user_id
  
  after_initialize :defaults
  
  validates :title, presence: true
  
  def defaults
    self.status ||= "open"
    self.priority ||= "normal"
  end
  
end
