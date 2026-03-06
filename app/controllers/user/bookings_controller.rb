class User::BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
 
  def book
  	@id = params[:id]
  end

  def send_otp
  	@id = params[:id]
    otp = rand(10000..99999)
    save_otp(otp)
    OtpMailer.with(user: current_user, otp: otp).otp_mail.deliver_now
    respond_to do |format|
    	format.turbo_stream
    end
  end

  def verify_otp 
  	@otp = current_user.otp.otp.to_i
  	otp = params[:otp].to_i
  	if otp == @otp 
  		current_user.otp.destroy
  		redirect_to user_ticket_path(params[:id])
  	else
  		flash.now[:alert] = "Wrong OTP, please try again."
      # render turbo_stream: turbo_stream.update("flash_messages", partial: "layouts/flash_message")
    end

  end

  def ticket
  	@id = params[:id]
  end

  def mail_ticket
  	@event = Event.find(params[:id])
	  @event.with_lock do	
	 	  seat_number = 1 + (@event.total_seat - @event.available_seat)
	 	  @booking = Booking.create(user:current_user, event: @event, seat_number:seat_number)
	    handle_available_seat(@event)
	    OtpMailer.with(user: current_user, event: @event, booking: @booking).ticket_mail.deliver_now
	  end
	  redirect_to user_events_path
  end

  private 
  def check_user
    redirect_to new_user_session_path unless current_user.user?
  end

  def save_otp(otp) 
  	@otp = Otp.find_by(user: current_user)
  	if !@otp.nil?
  	   @otp.otp = otp 
  	   @otp.save 
  	else
  	  @user = current_user
  	  @user.create_otp(otp: otp)
  	end
  end

  def handle_available_seat(event)
  	event.available_seat = event.available_seat - 1
  	event.save
  end
  

end
