class LikeBlogsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :load_blog, only: [:create, :destroy]

  def create
    @like = @blog.likes.build user_id: current_user.id
    if @like.save
      @notification = create_notification @like
      #ActionCable.server.broadcast "notifications:#{current_user.id}", {notification: @notification}
      #ActionCable.server.broadcast "notifications:4", {html: "<div>Hello world</div>"}
       ActionCable.server.broadcast "notifications:4", {html: "<div>Hello world</div>"}
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @like = @blog.likes.find_by user_id: current_user.id
    if @like.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def create_notification like
    return if like.target.user_id == current_user.id
      like.target.notifications.create! user_id: like.target.user_id,
      user_create_id: like.user_id, notice_type: Settings.like
  end

  def load_blog
    @blog = Post.find_by id: params[:id]
    render file: Settings.page_404_url unless @blog
  end

  def render_notification notification
    ApplicationController.renderer.render(partial: "notifications/notification",
      locals: { notification: notification })
  end
end
