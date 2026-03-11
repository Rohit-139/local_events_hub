class User::ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user


  def show
    @booking = Booking.find(params[:booking_id])
    @chat_room = @booking.chat_room
    @messages = @chat_room.messages.includes(:user)
    @message = Message.new
  end

    private 
  def check_user
    redirect_to new_user_session_path unless current_user.type == "Customer"
  end

end
