class Project < ActiveRecord::Base
  attr_accessible :name, :status, :time_closed, :user_id
  
  validates :name, presence: true
  
  after_initialize :defaults
  
  has_many :tasks
  belongs_to :user
  def defaults
    self.status ||= "open"
  end
end
