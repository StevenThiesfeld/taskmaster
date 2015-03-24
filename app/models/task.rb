class Task < ActiveRecord::Base
  attr_accessible :body, :created_by, :priority, :project, :status, :title, :user_id
  
  after_initialize :defaults
  
  validates :title, presence: true 
  validates :title, length: {in: 1..30}, if: " title != '' " 
  has_many :comments
  def defaults
    self.status ||= "open"
    self.priority ||= "normal"
  end
  
end
