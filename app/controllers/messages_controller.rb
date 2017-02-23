class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    message = Message.new message_params.merge user: current_user
    if message.save
      ActionCable.server.broadcast "messages",
        message: message.content,
        user: message.user.name
      head :ok
    end
  end

  private
  def message_params
    params.require(:message).permit :content, :project_id
  end
end
