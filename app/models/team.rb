class Team < ActiveRecord::Base
  attr_accessible :lead_id, :project_id, :user_id
  has_many :members, class_name: "User", foreign_key: "id"
  belongs_to :project
end
