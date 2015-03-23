class Task < ActiveRecord::Base
  attr_accessible :body, :created_by, :priority, :project, :status, :title, :user_id
end
