class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :clearance, :name, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true, length: {in: 3..24}
  validates :password, length: {in: 6..24}
  after_initialize :defaults
  has_many :projects
  has_many :comments
  has_many :teams
  
  def defaults
    self.clearance ||= "user"
  end
  
end
