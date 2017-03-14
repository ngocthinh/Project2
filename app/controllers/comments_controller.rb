class CommentsController < ApplicationController
  before_action :load_project, only: [:new, :create]

  def create
    @comment = @project.comments.build comment_params
    if @comment.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    respond_to do |format|
      if @comment.destroy
        format.html {redirect_to projects_url}
      else
        format.html {redirect_to :back}
      end
      format.js {render layout: false}
    end
  end

  def edit
  @comment = Comment.find_by id: params[:id]
  respond_to do |format|
    format.js
  end
end

def update
  @comment = Comment.find_by id: params[:comment][:id]
  if @comment.user_id == current_user.id
     if @comment.update_attribute(:content, params[:comment][:content])
       respond_to do |format|
         format.html {redirect_to root_path}
         format.js
        end
     else
       flash[:alert] = "Something wrong, try again"
       render root_path
     end
  end
end

  private

  def comment_params
    params.require(:comment).permit :name, :content, :user_id
  end

  def load_project
    @project = Project.find_by id: params[:comment][:project_id]
    render file: Settings.page_404_url unless @project
  end
end
