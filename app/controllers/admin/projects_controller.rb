class Admin::ProjectsController < Admin::AdminController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :load_project, only: [:edit, :update]
  load_and_authorize_resource

  def new
    @categories = Category.all
    @project = Project.new
    @project.images.build
  end

  def index
    @q = Project.ransack params[:q]
    @projects = Kaminari.paginate_array(@q.result.show_for_rating)
      .page(params[:page]).per(Settings.per_page.projects)
    @categories = Category.all
  end

  def create
    @project = current_user.projects.new project_params
    check_private_attributes
    if current_user.save
      flash[:success] = t "projects.created"
      redirect_to admin_project_participates_path(I18n.locale, @project)
    else
      @categories = Category.all
      flash[:danger] = t "images.create_failed"
      render :new
    end
  end

  def show
    @project = Project.find_by id: params[:id]
    @message = Message.new
    if @project
      @support = Supports::ProjectSupport.new(@project)
      @comments = @support.comments.order_by_newest
        .page(params[:page]).per Settings.per_page.comment
      respond_to do |format|
        format.html
        format.js
      end
    else
      flash[:warning] = t "record_isnt_exist"
      redirect_to root_url
    end
  end

  def edit
  end

  def update
    @project.update_attributes project_params
    if @project.save
      flash[:success] = t "succeed"
      redirect_to project_path(I18n.locale, @project)
    else
      render :edit
    end

  end

  private
  def check_private_attributes
    private_value = Array.new
    Project::PRIVATE_ATTRIBUTES.each do |key, value|
      if params[key] == Settings.private
        private_value.push value
      end
    end
    @project.private_attributes = private_value.join(",")
  end

  def load_project
    @project = Project.find_by id: params[:id]
    unless @project
      flash[:danger] = t "project_not_found"
      redirect_to root_url
    end
  end

  def project_params
    params.require(:project).permit :name, :url, :description, :core_features, :pm_url,
      :realease_note, :git_repository, :server_information, :platform, :category_id,
      :pm_url, images_attributes: [:id, :image, :image_cache, :_destroy]
  end
end
