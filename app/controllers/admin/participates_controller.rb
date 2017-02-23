class Admin::ParticipatesController < Admin::AdminController
  before_action :authenticate_user!
  before_action :load_project, only: [:create, :index, :destroy]
  before_action :load_participate, only: [:destroy, :show]
  load_and_authorize_resource

  def index
    @t = User.member_not_in_project(@project.participates.pluck :user_id).ransack params[:t]
    @users = @t.result.page(params[:page]).per Settings.per_page.user
    @participates = @project.participates
  end

  def new
  end

  def create
    @participate = Participate.new participate_params
    @participate.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @participate.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def participate_params
    params.require(:participate).permit(:position, :user_id, :project_id)
      .merge is_accept: true
  end

  def load_project
    @project = Project.find_by id: params[:project_id]
    unless @project
      flash[:danger] = t "project_not_found"
      redirect_to root_url
    end
  end

  def load_participate
    @participate = Participate.find_by id: params[:id]
    unless @participate
      flash[:danger] = t "user_not_found"
      redirect_to root_url
    end
  end
end
