class BlogsController < ApplicationController
  before_action :load_categories
  before_action :authenticate_user!, only: [:create, :new]

  def index
    if params[:category].blank?
      @blogs = Post.blog.order_by_newest.page(params[:page]).per Settings.per_page.blog
    else
      @category = Category.find_by id: params[:category]
      if @category
        @blogs = @category.posts.post_by_category_and_type(params[:category], Post.target_types[:blog])
          .order_by_newest.page(params[:page]).per Settings.per_page.blog
      else
        flash[:danger] = t "record_isnt_exist"
        redirect_to blogs_path
      end
    end
  end

  def show
    @blog = Post.find_by id: params[:id]
    if @blog
      @posts_relate = @blog.category.posts.blog.except_id(@blog.id).order_by_newest
      @like = @blog.likes.find_by(user_id: current_user.id) unless current_user.nil?
    else
      flash[:warning] = t "record_isnt_exist"
      redirect_to root_url
    end
    if params[:notification_id]
      @notification = Notification.find_by id: params[:notification_id]
      @notification.update(checked: true) unless @notification.nil?
    end
  end

  def new
  end

  def create
    @blog = current_user.posts.new post_params
    if @blog.save
      flash[:success] = t "blogs.created"
      redirect_to blogs_path
    else
      flash[:danger] = t "blogs.create_failed"
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image,
      :user_id, :category_id).merge(target_type: Post.target_types[:blog])
  end

  def load_categories
    @categories = Category.blog
  end
end
