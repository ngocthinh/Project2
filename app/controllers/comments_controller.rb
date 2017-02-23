class CommentsController < ApplicationController
  before_action :load_project, only: :create

  def create
    @comment = @project.comments.build comment_params
    if @comment.save
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit :name, :content
  end

  def load_project
    @project = Project.find_by id: params[:comment][:id]
    render file: Settings.page_404_url unless @project
  end
end
