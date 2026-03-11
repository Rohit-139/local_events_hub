class Admin::BookingsController < ApplicationController
    before_action :authenticate_user!
  before_action :check_admin


  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings = Booking.where(event_id: params[:id])
  end

   private
  def check_admin
  redirect_to new_user_session_path unless current_user.type == 'Admin'
  end
end
