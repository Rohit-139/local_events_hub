class User::AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    if @address.save 
      redirect_to user_events_path
    else
      render :new , status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end


  private 
  def check_user
    redirect_to new_user_session_path unless current_user.user?
  end

  def address_params
    params.require(:address).permit(:street, :city, :state)
  end
end


