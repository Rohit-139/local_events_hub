class User::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  def index
    if !current_user.address.present?
      redirect_to new_user_address_path 
    else
      @distance = params[:distance].present? ? params[:distance].to_i : 5
      @events = Event.near([current_user.address.latitude, current_user.address.longitude],@distance, units: :km)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private 
  def check_user
    redirect_to new_user_session_path unless current_user.type == "Customer"
  end
end
