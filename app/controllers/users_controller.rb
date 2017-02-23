class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :correct_user, only: [:edit, :update]

  def index
    @q = User.ransack params[:q]
    @users = @q.result.page(params[:page]).per Settings.per_page.user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "profile.created"
      redirect_to root_url
    else
      flash[:error] = t "profile.create_fail"
      render new_user_path
    end
  end

  def edit
  end

  def update
    @user.update_attributes user_params
    if @user.save
      flash[:success] = t "succeed"
      redirect_to user_path(I18n.locale, @user)
    else
      render :edit
    end
  end

  def show
    @user = User.find_by id: params[:id]
    if @user
      @certificate_users = @user.certificate_users
      @techniques = @user.techniques
    else
      flash[:warning] = t "record_isnt_exist"
      redirect_to root_url
    end
  end

  private
  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless @user == current_user
  end

  def user_params
    params.require(:user).permit :name, :user_name, :email, :password,
      :password_confirmation, :avatar, :biography, :position, :phone
  end
end
