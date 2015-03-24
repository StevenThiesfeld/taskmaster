class CommentsController < ApplicationController
  def create
    comment = Comment.new(params[:comment])
    if comment.save
      render "tasks/update_project"
    end
  end
  
end
