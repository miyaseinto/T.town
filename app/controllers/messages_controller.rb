class MessagesController < ApplicationController
  before_action :move_to_index

  def index
    @messages = Message.new
    @message = Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html
        format.json
      end
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
