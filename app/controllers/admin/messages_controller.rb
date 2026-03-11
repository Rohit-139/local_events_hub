class Admin::MessagesController < ApplicationController
    before_action :authenticate_user!
  before_action :check_admin
   def create
     @chat_room = ChatRoom.find(params[:message][:chat_room_id])
    @message = @chat_room.messages.new(message_params)
    @message.user = current_user 
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:body, :chat_room_id)
  end

  
  def check_admin
  redirect_to new_user_session_path unless current_user.type == 'Admin'
  end
end
