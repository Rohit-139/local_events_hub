class User::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  def index
    if !current_user.address.present?
      redirect_to new_user_address_path 
    else
      @events = Event.near([current_user.address.latitude, current_user.address.longitude],5, units: :km)
    end
  end

  def show
  end

  private 
  def check_user
    redirect_to new_user_session_path unless current_user.user?
  end
end
