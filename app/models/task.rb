class Task < ActiveRecord::Base
  attr_accessible :body, :created_by, :priority, :project, :status, :title, :user_id, :row_ordering,
  :task_number
  after_initialize :set_defaults
  
  validates :title, presence: true 
  validates :title, length: {in: 1..30}, if: " title != '' " 
  has_many :comments
  
  def set_defaults
    self.status ||= "open"
    self.priority ||= "normal"
    self.row_ordering ||= -1
  end
  
end
