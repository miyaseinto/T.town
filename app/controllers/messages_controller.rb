class MessagesController < ApplicationController
  # before_action :set_group

  def index
    @messages = Message.new
    @message = Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path
    else
      render :index
    end
  end
  private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end
